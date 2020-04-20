import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pdv_elevati/app/modules/venda/pages/vender/vender_controller.dart';
import 'package:pdv_elevati/app/modules/venda/venda_module.dart';

class VenderPage extends StatefulWidget {
  final String title;
  const VenderPage({Key key, this.title = "Vender"}) : super(key: key);

  @override
  _VenderPageState createState() => _VenderPageState();
}

class _VenderPageState extends State<VenderPage> {
  var controller = VendaModule.to.get<VenderController>();
  
  @override
  void initState() {
    super.initState();
    controller.listarProdutos();
  }

  @override
  Widget build(BuildContext context) {     
    return WillPopScope(
      onWillPop: () async {
        bool result = false;
        controller.listarProdutos(produtos: controller.indice);
        return result;
      },
      child: Scaffold(
            body: Stack(
              children: <Widget>[Observer(
          builder: (_){
              return GridView.count(
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.aspectRatio * 3,
                children: controller.botoes,
                padding: EdgeInsets.all(8),
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
          );
          },     
        ),],
            ),
      ),
    );
  }
}
