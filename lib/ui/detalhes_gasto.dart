import 'package:flutter/material.dart';

class DetalhesGasto extends StatefulWidget {
  Map<dynamic, dynamic> gasto = Map();

  DetalhesGasto({this.gasto});

  @override
  _DetalhesGastoState createState() => _DetalhesGastoState();
}

class _DetalhesGastoState extends State<DetalhesGasto> {
  Map<dynamic, dynamic> _gasto = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gasto = widget.gasto;
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
                padding: EdgeInsets.only(left: 115.0),
                child: Row(
                  children: <Widget>[
                    Text("Ranking ",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                    
                  ],
                )),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: <Widget>[
                      Card(
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
                                      image: NetworkImage(
                                          "https://www.google.com.br/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjDte2CipPfAhUBg5AKHZJiDa8QjRx6BAgBEAU&url=https%3A%2F%2Ficons8.com%2Ficon%2F528%2Fcontacts&psig=AOvVaw0_1zzSyNE_kqwEupQ3hbQx&ust=1544456247603744")),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Parlamentar X",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25.0),
                                              child: Text(
                                                "1.673",
                                                style:
                                                    TextStyle(fontSize: 14.0),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Icon(Icons.thumb_down,
                                                  color: Colors.red),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
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
                                      image: NetworkImage(
                                          "https://www.google.com.br/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjDte2CipPfAhUBg5AKHZJiDa8QjRx6BAgBEAU&url=https%3A%2F%2Ficons8.com%2Ficon%2F528%2Fcontacts&psig=AOvVaw0_1zzSyNE_kqwEupQ3hbQx&ust=1544456247603744")),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Parlamentar Y",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25.0),
                                              child: Text(
                                                "1.234",
                                                style:
                                                    TextStyle(fontSize: 14.0),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Icon(Icons.thumb_down,
                                                  color: Colors.red),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
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
                                      image: NetworkImage(
                                          "https://www.google.com.br/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjDte2CipPfAhUBg5AKHZJiDa8QjRx6BAgBEAU&url=https%3A%2F%2Ficons8.com%2Ficon%2F528%2Fcontacts&psig=AOvVaw0_1zzSyNE_kqwEupQ3hbQx&ust=1544456247603744")),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Parlamentar Z",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25.0),
                                              child: Text(
                                                "1.003",
                                                style:
                                                    TextStyle(fontSize: 14.0),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Icon(Icons.thumb_down,
                                                  color: Colors.red),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
