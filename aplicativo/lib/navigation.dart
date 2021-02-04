import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Listar Cartões'),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('Adicionar Cartão'),
            leading: Icon(Icons.view_list),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/adicionar');
            },
          ),
          ListTile(
            title: Text('Atualizar Cartão'),
            leading: Icon(Icons.keyboard_arrow_down),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushReplacementNamed('/Atualizar');
            },
          ),
          ListTile(
            title: Text('Remover Cartão'),
            leading: Icon(Icons.assignment),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/Remover');
            },
          ),
        ],
      ),
    );
  }
}