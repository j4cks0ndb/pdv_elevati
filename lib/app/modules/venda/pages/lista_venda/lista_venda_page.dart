import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListaVendaPage extends StatefulWidget {
  final String title;
  const ListaVendaPage({Key key, this.title = "ListaVenda"}) : super(key: key);

  @override
  _ListaVendaPageState createState() => _ListaVendaPageState();
}

class _ListaVendaPageState extends State<ListaVendaPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("Compras"), 
          subtitle: Text("2 x 11.00 = 22.00"),         
          trailing: IconButton(
            icon: Icon(Icons.delete_forever),
            color: Colors.red,
            onPressed: () {
              
            },
        )),ListTile(
          title: Text("Compras2"),          
          subtitle: Text("1 x 10.00 = 10.00"),
          trailing: IconButton(
            icon: Icon(Icons.delete_forever),

            color: Colors.red,
            onPressed: () {
              
            },
        )),
      ],
    );
  }

}
