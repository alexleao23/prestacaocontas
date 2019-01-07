import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_precisava/services/api.dart' as api;
import 'package:flutter_precisava/models/deputado.dart';
import 'package:flutter_precisava/models/despesa.dart';
import 'package:flutter_precisava/models/comentario.dart';
import 'package:flutter_precisava/ui/components/deputadoCard.dart';

class DetalhesDespesas extends StatefulWidget {
  Despesa despesa;
  Deputado deputado;
  String _api_token;

  DetalhesDespesas(this.despesa, this.deputado, this._api_token);

  _DetalhesDespesasState createState() => _DetalhesDespesasState();
}

class _DetalhesDespesasState extends State<DetalhesDespesas> {
  Despesa despesa;
  Deputado deputado;
  String _api_token;
  String dataEmissao;
  TextEditingController comentarioController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    despesa = widget.despesa;
    deputado = widget.deputado;
    _api_token = widget._api_token;
    comentarioController = new TextEditingController();
    despesa.valor_documento =
        double.tryParse(despesa.valor_documento).toStringAsFixed(2);
    try {
      DateTime dataAux = DateTime.parse(despesa.data_emissao);
      dataEmissao = DateFormat("dd/MM/yyyy").format(dataAux);
    } catch (e) {
      dataEmissao = despesa.data_emissao;
    }
    api.getComentarios(deputado.id, despesa.id, _api_token).then((result) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Precisava? Despesas"),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) => Container(
                //padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.green,
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        title: Text("Detalhes da Despesa",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Deputado",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Deputado: ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text("${deputado.nome_eleitoral}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Partido: ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text("${deputado.sigla_partido}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ))
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Documento",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Tipo de Despesa: ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text("${despesa.descricao}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Data de Emissão: ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text("${dataEmissao}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ))
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Fornecedor",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Nome: ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                Text("${despesa.fornecedor}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ))
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
                            child: Row(
                              children: <Widget>[
                                Text("Valores",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
                            child: Row(
                              children: <Widget>[
                                Text("R\$ ${despesa.valor_documento}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: comentarioController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    await api.sendComment(
                                        deputado.id,
                                        despesa.id,
                                        comentarioController.text,
                                        _api_token);
                                    comentarioController.text = "";
                                    setState(() {});
                                  }
                                },
                              ),
                              hintText: "Insira seu Comentario",
                              border: OutlineInputBorder()),
                          style: TextStyle(fontSize: 20, color: primary),
                          validator: (value) {
                            if (value.isEmpty) return "Comentario não digitado";
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Comentario>>(
                        future: api.getComentarios(
                            deputado.id, despesa.id, _api_token),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.length > 0) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      _comentarioCard(snapshot.data[index]));
                            } else {
                              return Center(
                                child: Text("Sem comentários"),
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    )
                  ],
                ),
              ),
        ));
  }

  void _showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Obrigado por votar"),
    ));
  }

  Widget _comentarioCard(Comentario comentario) {
    return Card(
      color: Colors.green,
      margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Usuario: ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              comentario.descricao,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
