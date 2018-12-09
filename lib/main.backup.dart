import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

const request =
    "https://brasil.io/api/dataset/gastos-deputados/cota_parlamentar/data?sguf=AP&limit=5";

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

Future<List> getData() async {
  http.Response response = await http.get(request);
  var teste = json.decode(response.body);
  print(teste['results'][0]['txnomeparlamentar']);
  // for (var item in teste['results']) {
  //   print(item['txnomeparlamentar']);
  // }
  return teste['results'];
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> deptsFeds = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(getData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Precisava?"),
          centerTitle: true,
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data.length);
                    return _deptFedCard(context, index, snapshot.data);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget _deptFedCard(BuildContext context, int index, var results) {
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
                  image:
                      DecorationImage(image: AssetImage("images/person.png")),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      results[index]['txnomeparlamentar'],
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Algo",
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
        () {};
      },
    );
  }
}
