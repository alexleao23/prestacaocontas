import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter_precisava/services/api.dart' as api;

Color secondary = const Color.fromARGB(255, 82, 206, 104);
Color primary = const Color.fromARGB(255, 0, 156, 59);

Widget deputadoCard(String nomeEleitoral, String siglaPartido, String urlFoto,
    int reacoes_neg, int reacoes_pos) {
  return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Stack(
        children: <Widget>[
          _card(nomeEleitoral, siglaPartido, reacoes_neg, reacoes_pos),
          _image(urlFoto)
        ],
      ));
}

Widget _card(String nomeEleitoral, String siglaPartido, int reacoes_neg,
    int reacoes_pos) {
  return Container(
    child: Container(
      //planetCardContent
      margin: EdgeInsets.fromLTRB(55.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4),
          Material(
            color: Colors.transparent,
            child: Text(
              nomeEleitoral,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(height: 4),
          Material(
            color: Colors.transparent,
            child: Text(
              siglaPartido,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: LinearPercentIndicator(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  width: constraints.maxWidth,
                  percent: (reacoes_neg + reacoes_pos) > 0
                      ? (reacoes_pos / (reacoes_neg + reacoes_pos))
                      : 0.5,
                  backgroundColor: Colors.red,
                  progressColor: Colors.greenAccent,
                  fillColor: Colors.transparent,
                  animateFromLastPercent: true,
                ),
              );
            },
          ),
          votar(reacoes_pos, reacoes_neg)
        ],
      ),
    ),
    height: 124,
    margin: EdgeInsets.only(left: 39),
    decoration: BoxDecoration(
      color: primary,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

Widget _image(String urlFoto) {
  return Container(
    width: 78,
    margin: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      image: DecorationImage(
        image: NetworkImage(urlFoto),
        alignment: FractionalOffset.centerLeft,
      ),
    ),
  );
}

Widget votar(int qtdLike, int qtdUnlike) {
  return Row(
    children: <Widget>[
      _thumbs(Icons.thumb_up, qtdLike, 1),
      _thumbs(Icons.thumb_down, qtdUnlike, 0)
    ],
  );
}

Widget _thumbs(IconData icon, int votos, int reacao) {
  return Expanded(
    child: Row(
      children: <Widget>[
        GestureDetector(
          child: Icon(
            icon,
            color: Colors.white,
          ),
          onTap: () async {
            //api.sendReaction(reacao, deputado.id, despesa.id, _api_token);
          },
        ),
        Container(width: 8),
        Material(
          color: Colors.transparent,
          child: Text(
            votos.toString(),
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

class barraVotoStful extends StatefulWidget {
  int react_neg;
  int react_pos;

  barraVotoStful(this.react_neg, this.react_pos);

  @override
  _barraVotoStfulState createState() => _barraVotoStfulState();
}

class _barraVotoStfulState extends State<barraVotoStful> {
  int react_neg;
  int react_pos;
  int total_react;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    react_pos = widget.react_pos;
    react_neg = widget.react_neg;
    total_react = react_neg + react_pos;
  }

  @override
  Widget build(BuildContext context) {
    double percentualPositivo =
        total_react > 0 ? (react_pos / total_react) : 0.5;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: LinearPercentIndicator(
            padding: EdgeInsets.symmetric(horizontal: 1),
            width: constraints.maxWidth,
            percent: percentualPositivo,
            backgroundColor: Colors.red,
            progressColor: Colors.greenAccent,
            fillColor: Colors.transparent,
            animateFromLastPercent: true,
          ),
        );
      },
    );
  }
}
