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
  Deputados(this._api_token);

  _DeputadosState createState() => _DeputadosState();
}

class _DeputadosState extends State<Deputados> {
  String _api_token;

  Color secondary = const Color.fromARGB(255, 82, 206, 104);
  Color primary = const Color.fromARGB(255, 0, 156, 59);
  Color fabColor = const Color.fromARGB(255, 0, 39, 118);

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _api_token = widget._api_token;
  }

  IconData fabIcon = Icons.trending_up;
  String order = "name";

  @override
  Widget build(BuildContext context) {
    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
          new Icon(Icons.exit_to_app), Colors.blue, 4.0, "Button menu", () {
        try {
          _getFile().then((file) {
            file.delete();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          });
        } catch (e) {}
      }, "Sair", Colors.blue, Colors.white, true),
      new FabMiniMenuItem.withText(new Icon(Icons.poll), Colors.blue, 4.0,
          "Button menu", () {}, "Ranking", Colors.blue, Colors.white, true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Precisava? Deputados"),
        centerTitle: true,
      ),
      // Especifiquei o tipo de retorno do FutureBuilder só por precaução mesmo,
      // Assim o snapshot.data vai ser um List<Deputado> (ele já iria ser isso mesmo,
      // porque é o retorno da api, mas é bom se precaver né)
      body: Stack(
        children: <Widget>[
          FutureBuilder<List<Deputado>>(
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
          FabDialer(_fabMiniMenuItemList, Colors.blue, Icon(Icons.add))
        ],
      ),
    );
  }

  Widget _createDeputadoList(BuildContext context, List<Deputado> deputados) {
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
                          Despesas(deputados[index], _api_token)));
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
                    deputados[index].total_reacoes_positivas,
                    deputados[index].id,
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
