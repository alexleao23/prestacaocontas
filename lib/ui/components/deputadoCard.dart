import 'package:flutter/material.dart';
import 'package:flutter_precisava/services/api.dart' as api;

Color secondary = const Color.fromARGB(255, 82, 206, 104);
Color primary = const Color.fromARGB(255, 0, 156, 59);

Widget deputadoCard(
    String nomeEleitoral, String siglaPartido, String urlFoto, int reacoes_neg, int reacoes_pos, int heroTag) {
  return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Stack(
        children: <Widget>[
          _card(nomeEleitoral, siglaPartido, reacoes_neg, reacoes_pos),
          _image(urlFoto, heroTag)
        ],
      ));
}

Widget _card(String nomeEleitoral, String siglaPartido, int reacoes_neg, int reacoes_pos) {
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
          barraVotos(),
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

Widget _image(String urlFoto, int heroTag) {
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

Widget votar(int qtdLike, int qtdUnlike, [bool isVotable, int size]) {
  
  if (isVotable == null) {
    return Row(
      children: <Widget>[
        _thumbs(Icons.thumb_up, qtdLike, 1),
        _thumbs(Icons.thumb_down, qtdUnlike, 0)
      ],
    );
  }
  if (isVotable == true) {
    return Row(
      children: <Widget>[
        _thumbs(Icons.thumb_up, qtdLike, 1, votar: isVotable),
        _thumbs(Icons.thumb_down, qtdUnlike, 0, votar: isVotable)
      ],
    );
  }
}

Widget _thumbs(IconData icon, int votos, int reacao, {bool votar}) {
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
                fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget barraVotos() {
  return Expanded(
    flex: 0,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 2,
      color: secondary,
    ),
  );
}
