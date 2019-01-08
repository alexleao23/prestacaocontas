import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_precisava/services/api.dart' as api;
import 'package:flutter_precisava/models/user.dart';
import 'package:flutter_precisava/ui/deputados.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color secondary = const Color.fromARGB(255, 82, 206, 104);
  Color primary = const Color.fromARGB(255, 0, 156, 59);

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final pwdConfirmController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateTime data_nasc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Precisava? Cadastro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildTextFormField(Icons.person_outline, "Digite seu usuario",
                    nomeController, "Usuario não informado", false),
                Divider(),
                buildTextFormField(Icons.alternate_email, "Digite seu email",
                    emailController, "Email não informado", false),
                Divider(),
                buildTextFormField(Icons.lock_outline, "Digite sua senha",
                    pwdController, "Senha não informada", true),
                Divider(),
                buildTextFormField(Icons.lock_outline, "Repita sua senha",
                    pwdConfirmController, "Senha não confirmada", true),
                Divider(),
                DateTimePickerFormField(
                    validator: (valor) {
                      if (valor.toString().isEmpty || valor == null) {
                        return "Insira uma data";
                      }
                    },
                    dateOnly: true,
                    format: dateFormat,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        hintText: "Data de nascimento",
                        border: OutlineInputBorder()),
                    style: TextStyle(fontSize: 20, color: primary),
                    onChanged: (dt) {
                      data_nasc = dt;
                    }),
                Divider(),

                //inserir a data de nascimento
                MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _loadingDialog();
                      String data_nasc_format =
                          DateFormat("yyyy-MM-dd").format(data_nasc).toString();
                      User newUser = await api.registerUser(
                          emailController.text,
                          pwdController.text,
                          pwdConfirmController.text,
                          nomeController.text,
                          data_nasc_format);
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Sucesso"),
                              content: Text("Seu usuário foi cadastrado"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Ok"),
                                  onPressed: () async {
                                    await api
                                        .getUser(emailController.text,
                                            pwdController.text)
                                        .then((loggedUser) {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Deputados(loggedUser.api_token, loggedUser.id)));
                                    });
                                  },
                                )
                              ],
                            );
                          });
                    }
                  },
                  height: 60,
                  color: primary,
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
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
        });
  }

  Widget buildTextFormField(IconData icon, String hintText,
      TextEditingController c, String error, bool secureInfo) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder()),
      style: TextStyle(fontSize: 20, color: primary),
      controller: c,
      obscureText: secureInfo,
      validator: (value) {
        if (error == "Senha não confirmada"){
          if (value != pwdController.text) return "Senhas não coincidem";
        }
        if (value.isEmpty) return error;
      },
    );
  }
}
