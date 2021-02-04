import 'package:flutter/material.dart';
import 'package:flutter_app/card_insert.dart';
import 'package:flutter_app/card_list.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Gtd Modelo',
        home: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gtd Ver 03',
      theme: new ThemeData.dark(),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Home Gtd"),
        ),
        body: new Container(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  Padding(
                    child: new Row(
                      children: [
                        RaisedButton(
                            child: Text("Visualizar Cartões"),
                            onPressed: (){
                              var route = new MaterialPageRoute(builder: (BuildContext context) => new CardLists());
                              Navigator.of(context).push(route);
                            })
                      ],
                    ),
                      padding: EdgeInsets.all(100.0),
                  ),
                  Padding(
                    child: new Row(
                      children: [
                        RaisedButton(
                            child: Text("Adicionar Cartões"),
                            onPressed: (){
                              var route = new MaterialPageRoute(builder: (BuildContext context) => new InsertCardHome());
                              Navigator.of(context).push(route);
                            })
                      ],
                    ),
                    padding: EdgeInsets.all(100.0),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
