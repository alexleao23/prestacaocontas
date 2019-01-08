import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_precisava/services/api.dart' as api;
import 'package:flutter_precisava/models/deputado.dart';
import 'package:flutter_precisava/models/total_reacoes.dart';
import 'package:flutter_precisava/ui/login.dart';
import 'package:flutter_precisava/ui/despesas.dart';
import 'package:flutter_precisava/ui/components/deputadoCard.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';

class Deputados extends StatefulWidget {
  String _api_token;
  int _user_id;
  Deputados(this._api_token, this._user_id);

  _DeputadosState createState() => _DeputadosState();
}

class _DeputadosState extends State<Deputados> {
  String _api_token;
  int _user_id;

  Color secondary = const Color.fromARGB(255, 82, 206, 104);
  Color primary = const Color.fromARGB(255, 0, 156, 59);
  Color fabColor = const Color.fromARGB(255, 0, 39, 118);

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _api_token = widget._api_token;
    _user_id = widget._user_id;
    print("tela deputados $_user_id");
  }

  IconData fabIcon = Icons.sort_by_alpha;
  String order = "Nome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Precisava? Deputados"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              try {
                _getFile().then((file) {
                  file.delete();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                });
              } catch (e) {}
            },
          )
        ],
      ),
      // Especifiquei o tipo de retorno do FutureBuilder só por precaução mesmo,
      // Assim o snapshot.data vai ser um List<Deputado> (ele já iria ser isso mesmo,
      // porque é o retorno da api, mas é bom se precaver né)
      body: FutureBuilder<List<Deputado>>(
        future: api.getDeptReacoes(_api_token),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _createDeputadoList(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: 
      FloatingActionButton.extended(
        backgroundColor: fabColor,
        tooltip: "Ordem de Visualização",
        label: Text(order),
        icon: Icon(
          fabIcon,
        ),
        onPressed: () {
          setState(() {
            if (order == "Nome") {
              order = "Ranking Up";
              fabIcon = Icons.trending_up;
            } else if (order == "Ranking Up") {
              order = "Ranking Down";
              fabIcon = Icons.trending_down;
            } else if (order == "Ranking Down") {
              order = "Nome";
              fabIcon = Icons.sort_by_alpha;
            } 
          });
        },
      ),
    );
  }

  Widget _createDeputadoList(BuildContext context, List<Deputado> deputados) {
    if (order == "Ranking Down") {
      deputados.sort((a, b) => b.total_reacoes_negativas.compareTo(a.total_reacoes_negativas));
    } else if (order == "Ranking Up") {
      //trocar pra  votos
      deputados.sort((a, b) => b.total_reacoes_positivas.compareTo(a.total_reacoes_positivas));
    } else if (order == "Nome") {
      deputados.sort((a, b) => a.nome_eleitoral.compareTo(b.nome_eleitoral));
    }

    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: deputados.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Despesas(deputados[index], _api_token, _user_id)));
            },
            child: Hero(
                tag: deputados[index].nome_eleitoral,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: deputadoCard(
                    deputados[index].nome_eleitoral,
                    deputados[index].sigla_partido,
                    deputados[index].url_foto,
                    deputados[index].total_reacoes_negativas,
                    deputados[index].total_reacoes_positivas
                  ),
                )),
          );
        });
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }
}
