import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/navigation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/card_list.dart';

/*class UpdateCardHome extends StatelessWidget{
  final Card_data value;

  UpdateCardHome((Key key, this.value), this.value) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData.dark(),
      home: UpdateCard(),
    )
  }
}*/

class UpdateCard extends StatefulWidget{
  final Card_data value;

  UpdateCard({Key key, this.value}) : super(key: key);

  @override
  _UpdateCard createState() => _UpdateCard();
}

class _UpdateCard extends State<UpdateCard>{

  TextEditingController cardTitle = new TextEditingController();
  TextEditingController cardBody = new TextEditingController();
  TextEditingController cardStatus = new TextEditingController();

  // ignore: missing_return
  Future<List> insertData() async{
    debugPrint("funciona: ${widget.value.card_id}");
    var response = await http.post("http://192.168.0.102:8079/php/gtd_edit.php", body: {
      "card_title": cardTitle.text,
      "card_body": cardBody.text,
      "card_status": cardStatus.text,
      "card_id": '${widget.value.card_id}',
    });
    var body = json.decode(response.body);

    if(response.statusCode == 200){
      debugPrint("Cartão Autalizado");
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
                child: Text("Salvar"),
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