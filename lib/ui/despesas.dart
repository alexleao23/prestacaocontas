import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_precisava/services/api.dart' as api;
import 'package:flutter_precisava/models/deputado.dart';
import 'package:flutter_precisava/models/despesa.dart';

import 'package:flutter_precisava/ui/detalhesDespesas.dart';
import 'package:flutter_precisava/ui/components/deputadoCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Despesas extends StatefulWidget {
  Deputado deputado;
  String _api_token;

  Despesas(this.deputado, this._api_token);
  _DespesasState createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {
  List<Despesa> despesas = List();
  Deputado deputado;
  String _api_token;
  int pageCounter = 0;

  Color fabColor = const Color.fromARGB(255, 0, 39, 118);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deputado = widget.deputado;
    _api_token = widget._api_token;

    _carregarMais();
  }

  _carregarMais() {
    bool isLoadingIndicator = false;
    if (despesas.length > 0) {
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
                      "Carregando despesas",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            );
          });
      isLoadingIndicator = true;
    }
    pageCounter++;
    List<Despesa> despesasAux = new List();
    api.getDespesas(deputado.id, _api_token, pageCounter).then((result) {
      setState(() {
        despesas += result;
        if (isLoadingIndicator == true) {
          isLoadingIndicator = false;
          Navigator.of(context).pop();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Precisava? Despesas"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 8,
          ),
          child: ListView(
            children: <Widget>[
              Hero(
                tag: deputado.nome_eleitoral,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: deputadoCard(deputado.nome_eleitoral,
                      deputado.sigla_partido, deputado.url_foto, deputado.total_reacoes_negativas, deputado.total_reacoes_positivas, deputado.id),
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: despesas.length > 0
                    ? StaggeredGridView.countBuilder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 4,
                        itemCount: despesas.length,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return _despesasCard(
                              context, despesas[index], deputado);
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(2),
                      )
                    : Center(
                        child: _loadingDialog("Carregando despesas"),
                      ),
              ),
              despesas.length > 0
                  ? MaterialButton(
                      minWidth: 1000,
                      height: 60,
                      onPressed: () async {
                        _carregarMais();
                      },
                      color: primary,
                      child: Text(
                        "Carregar mais",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  : Divider(),
            ],
          ),
        ));
  }

  Widget _loadingDialog(String texto) {
    return AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              texto,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Widget _despesasCard(BuildContext context, Despesa despesa, Deputado dept) {
    String data_emissao_aux;
    if (despesa.data_emissao == null) {
      data_emissao_aux = "Sem data";
    } else {
      DateTime dataEmissao = DateTime.parse(despesa.data_emissao);
      String data_emissao_format =
          DateFormat("dd/MM/yyyy").format(dataEmissao).toString();
      data_emissao_aux = data_emissao_format;
    }
    return GestureDetector(
      child: Card(
          elevation: 0,
          color: primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  despesa.descricao,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  //"${data_emissao_aux.split("-")[2].toString()}/${despesa.mes_documento}/${despesa.ano_documento}",
                  "$data_emissao_aux",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                    "Valor R\$${double.tryParse(despesa.valor_documento).toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16)),
                barraVotos(),
                Row(
                  children: <Widget>[
                    _thumbs(
                        Icons.thumb_up, Colors.greenAccent, despesa.num_reacoes_pos, 1, despesa.id),
                    _thumbs(Icons.thumb_down, Colors.red, despesa.num_reacoes_neg, 0,
                        despesa.id)
                  ],
                )
              ],
            ),
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetalhesDespesas(despesa, dept, _api_token)));
      },
    );
  }

  Widget _thumbs(IconData icon, Color iconColor, int votos, int reacao, int despesa) {
    String votosAux;
    votosAux = votos.toString();
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              icon,
              color: iconColor,
            ),
            onTap: () async {
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
                              "Reagindo",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    );
                  });
              await api.sendReaction(reacao, deputado.id, despesa, _api_token);
              votos++;
              setState(() {
                votosAux = votos.toString();
              });
              print(votos);
              Navigator.of(context).pop();
            },
          ),
          Container(width: 8),
          Text(
            votosAux,
            style: TextStyle(
                fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
