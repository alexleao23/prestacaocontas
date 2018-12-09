import 'package:flutter/material.dart';
import 'package:gastos_parlamentares/ui/parlamentar_detail.dart';

const request =
    "https://brasil.io/api/dataset/gastos-deputados/cota_parlamentar/data?sguf=AP&limit=5";

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> deptsFeds = [
    {
      "nome": "ANDRÉ ABDON",
      "partido": "PP/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/178831.jpg"
    },
    {
      "nome": "CABUÇU BORGES",
      "partido": "MDB/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/105112.jpg"
    },
    {
      "nome": "JANETE CAPIBERIBE",
      "partido": "PSB/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/73926.jpg"
    },
    {
      "nome": "JOZI ARAÚJO",
      "partido": "PODE/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/178851.jpg"
    },
    {
      "nome": "MARCOS REATEGUI",
      "partido": "PSD/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/178852.jpg"
    },
    {
      "nome": "PROFESSORA MARCIVANIA",
      "partido": "PCdoB/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/160641.jpg"
    },
    {
      "nome": "ROBERTO GÓES",
      "partido": "PDT/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/178995.jpg"
    },
    {
      "nome": "VINICIUS GURGEL",
      "partido": "PR/AP",
      "img": "http://www.camara.leg.br/internet/deputado/bandep/160591.jpg"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset("images/logo.png", fit: BoxFit.cover),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: deptsFeds.length,
            itemBuilder: (context, index) {
              print(deptsFeds.length);
              return _deptFedCard(context, index);
            }));
  }

  Widget _deptFedCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(deptsFeds[index]['img'])),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      deptsFeds[index]['nome'],
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      deptsFeds[index]['partido'],
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "Etc",
                      style: TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ParlamentarDetail(deptsFeds[index]['nome'])));
      },
    );
  }
}
