import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/delete_card.dart';
import 'package:flutter_app/navigation.dart';
import 'package:flutter_app/update_card.dart';
import 'package:http/http.dart' show get;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/card_insert.dart';

class Card_data{
  String card_title;
  String card_body;
  String card_id;

  Card_data({
    this.card_title,
    this.card_body,
    this.card_id,
  });

  factory Card_data.fromJson(Map<String, dynamic> json){
    return Card_data(
      card_title: json['card_title'],
      card_body: json['card_body'],
      card_id: json['card_id'],
    );
  }
}

Future<List<Card_data>> jsonMysqlData() async{

  final jsonEndpoint = "http://192.168.0.102:8079/php/gtd_select.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List card_data = json.decode(response.body);
    return card_data
        .map((card_data) => new Card_data.fromJson(card_data))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

/*Future<http.Response> fetchCardFiles(http.Client client) async {
  return client.get("http://192.168.0.104:8079/php/gtd_conn.php");
}*/

class CardLists extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: new ThemeData.dark(),
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text("Card Details"),
        ),
        body: new Center(
          child: new FutureBuilder<List<Card_data>>(
              future: jsonMysqlData(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  List<Card_data> card_data = snapshot.data;
                  return new CardViewList(card_data);
                } else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                return new CircularProgressIndicator();
              }
          ),
        ),
      ),
    );
  }
}


class CardViewList extends StatelessWidget{
  final List<Card_data> card_data;
  CardViewList(this.card_data);
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: card_data.length,
        itemBuilder: (context, int currentIndex){
          return createDragAndDropList(card_data[currentIndex], context);
        }
    );
  }
}


Widget createDragAndDropList(Card_data card_data, BuildContext context){
  return ListTile(
    title: new Card(
      elevation: 5.0,
      child: new Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              child: Text(
                card_data.card_title,
                style: new TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(bottom: 8.0),
            ),
            Row(
              children: <Widget>[
                Padding(
                    child: Text(
                      card_data.card_body,
                    ),
                    padding: EdgeInsets.all(1.0)
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    child: Text(
                      card_data.card_id,
                    ),
                    padding: EdgeInsets.all(1.0)
                ),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                    child: Text('Editar Cartão'),
                    onPressed: (){
                      var route = new MaterialPageRoute(builder: (BuildContext context) => new UpdateCard(value: card_data));
                      Navigator.of(context).push(route);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => new InsertCardHome(),),);
                    }
                ),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                    child: Text('Apagar Cartão'),
                    onPressed: (){
                      var route = new MaterialPageRoute(builder: (BuildContext context) => new DeleteCard(value: card_data));
                      Navigator.of(context).push(route);
                    }
                ),
              ],
            )
          ],
        ),
      ),
    ),
    onTap: (){
      var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
        new SecondScreen(value: card_data),
      );
      //A Navigator is a widget that manages a set of child widgets with
      //stack discipline.It allows us navigate pages.
      Navigator.of(context).push(route);
    },
  );
}

class SecondScreen extends StatefulWidget {
  final Card_data value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Detail Page')),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'CARD DETAILS',
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              ),
              Padding(
                child: new Text(
                  'TITLE : ${widget.value.card_title}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  'BODY : ${widget.value.card_body}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              )
            ],   ),
        ),
      ),
    );
  }
}


