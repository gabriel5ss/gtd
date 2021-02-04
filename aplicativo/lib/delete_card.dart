import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/navigation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/card_list.dart';

class DeleteCard extends StatefulWidget{
  final Card_data value;

  DeleteCard({Key key, this.value}) : super(key: key);

  @override
  _DeleteCard createState() => _DeleteCard();
}

class _DeleteCard extends State<DeleteCard>{

  Future<List> apagarCartao() async{
    var response = await http.post("http://192.168.0.102:8079/php/gtd_delete.php", body: {
      "card_id": '${widget.value.card_id}',
    });
    var body = json.decode(response.body);

    if(response.statusCode == 200){
      debugPrint("Cartão Apagado");
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
              Text("Deseja Realmente Apagar o Cartão?"),
              RaisedButton(
                child: Text("Sim"),
                onPressed: (){
                  apagarCartao();
                },
              ),
              RaisedButton(
                  child: Text("Não"),
                onPressed: (){

                },
              )
            ],
          )
      ),
    );
  }

}