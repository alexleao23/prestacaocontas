import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:gastos_parlamentares/ui/detalhes_gasto.dart';

String request =
    "https://brasil.io/api/dataset/gastos-deputados/cota_parlamentar/data?sguf=AP&txnomeparlamentar=";

Future<List> getData(String nome) async {
  http.Response response = await http.get(request + nome);
  var teste = json.decode(response.body);
  // print(teste['results'][0]);
  for (var item in teste['results']) {
    print(item['vlrdocumento']);
  }
  return teste['results'];
}

class ParlamentarDetail extends StatefulWidget {
  final String _nome;

  ParlamentarDetail(this._nome);

  @override
  _ParlamentarDetailState createState() => _ParlamentarDetailState();
}

class _ParlamentarDetailState extends State<ParlamentarDetail> {
  String nome;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nome = widget._nome;
    getData(nome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logo.png", fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                nome,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder<List>(
                future: getData(nome),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          print(snapshot.data.length);
                          return _gastoCard(context, index, snapshot.data);
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _gastoCard(BuildContext context, int index, var results) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Valor R\$: ${results[index]['vlrdocumento']}",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Tipo de gasto: ${results[index]['txtdescricao']}",
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            "Fornecedor: ${results[index]['txtfornecedor']}",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 25.0, right: 15.0),
                                child: Icon(Icons.thumb_up, color: Colors.green,),
                              ),
                              
                              Icon(Icons.thumb_down, color: Colors.red,)
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetalhesGasto(gasto: results[index])));
      },
    );
  }
}
