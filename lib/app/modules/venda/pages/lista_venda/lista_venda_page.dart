import 'package:flutter/material.dart';

class ListaVendaPage extends StatefulWidget {
  final String title;
  const ListaVendaPage({Key key, this.title = "ListaVenda"}) : super(key: key);

  @override
  _ListaVendaPageState createState() => _ListaVendaPageState();
}

class _ListaVendaPageState extends State<ListaVendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
