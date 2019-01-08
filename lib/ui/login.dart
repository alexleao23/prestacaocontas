import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_precisava/ui/deputados.dart';
import 'package:flutter_precisava/ui/register.dart';
import 'package:flutter_precisava/services/api.dart' as api;
import 'package:flutter_precisava/models/user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color secondary = const Color.fromARGB(255, 82, 206, 104);
  Color primary = const Color.fromARGB(255, 0, 156, 59);
  Color fabColor = const Color.fromARGB(255, 0, 39, 118);

  TextEditingController emailController;
  TextEditingController senhaController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    senhaController = TextEditingController();
    // emailController.text = "usuario1@mail.com";
    // senhaController.text = "usuario1";

    try {
      _readData().then((result) {
        var usuario = json.decode(result);
        _loadingDialog();
        api.getUser(usuario['email'], usuario['password']).then((user) {
          print("usuario ${user.id}");
          Navigator.of(context).pop();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Deputados(user.api_token, user.id)));
        });
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primary,
              ),
              margin: EdgeInsets.only(top: 110),
              width: 500,
              height: 310,
            ),
            Padding(padding: EdgeInsets.all(16),
              child: loginScreen(),
            )       
          ],
        )
      ),
    );
  }

  Widget loginScreen(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("img/icon.png"),
                )),
          ),
          Divider(color: primary,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                hintText: "Insira seu Email",
                border: OutlineInputBorder()),
            style: TextStyle(fontSize: 20, color: primary),
            controller: emailController,
            validator: (value) {
              if (value.isEmpty) return "Email não digitado";
            },
          ),
          Divider(color: primary,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Insira sua Senha",
                border: OutlineInputBorder()),
            style: TextStyle(fontSize: 20, color: primary),
            obscureText: true,
            controller: senhaController,
            validator: (value) {
              if (value.isEmpty) return "Senha não digitada";
            },
          ),
          Divider(color: primary,),
          FlatButton(
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _loadingDialog();
                User user = await api.getUser(
                    emailController.text, senhaController.text);
                if (user != null) {
                  _saveUser(user, senhaController.text).then((onValue) {
                    print(onValue);
                  });
                  Navigator.of(context).pop();
                  print("usuario ${user.id}");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Deputados(user.api_token, user.id)));
                } else {
                  Navigator.of(context).pop();
                  _showAvisoLogin();
                }
              }
            },
            color: fabColor,
            child: Text(
              "Entrar",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Divider(),
          Center(
            child: GestureDetector(
              child: Text(
                "Não possui conta? Toque aqui",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  _loadingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Entrando",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        );
      }
    );
  }

  _showAvisoLogin() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text("Credencias invalidas"),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  Future<File> _saveUser(User user, String password) async {
    Map<String, dynamic> dataAux = new Map();
    dataAux['email'] = user.email;
    dataAux['password'] = password;
    String data = json.encode(dataAux);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
