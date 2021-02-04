import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/navigation.dart';
import 'package:http/http.dart' as http;


class InsertCardHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData.dark(),
      home: new InsertCard(),
    );
  }
}

class InsertCard extends StatefulWidget{
  @override
  _InsertCard createState() => _InsertCard();
}

class _InsertCard extends State<InsertCard>{

  TextEditingController cardTitle = new TextEditingController();
  TextEditingController cardBody = new TextEditingController();
  TextEditingController cardStatus = new TextEditingController();

  // ignore: missing_return
  Future<List> insertData() async{
    var response = await http.post("http://192.168.0.102:8079/php/gtd_insert.php", body: {
      "card_title": cardTitle.text,
      "card_body": cardBody.text,
      "card_status": cardStatus.text,
    });
    var body = json.decode(response.body);

    if(response.statusCode == 200){
      debugPrint("Cartão Cadastrado");
    } else{
      debugPrint("não funciona: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserir Cartão"),
      ),
      body: new Center(
          child: Column(
            children: <Widget>[
              Text("Titulo"),
              TextField(
                controller: cardTitle,
                decoration: InputDecoration(
                    hintText: 'Titulo do Cartão'
                ),
              ),
              Text("Descrição"),
              TextField(
                controller: cardBody,
                decoration: InputDecoration(
                    hintText: 'Descrição do Cartão'
                ),
              ),
              Text("Status"),
              TextField(
                controller: cardStatus,
                decoration: InputDecoration(
                    hintText: 'Status do Cartão'
                ),
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: (){
                  insertData();
                },
              ),
            ],
          )
      ),
    );
  }



}