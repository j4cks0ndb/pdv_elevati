import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pdv_elevati/app/modules/venda/pages/lista_venda/lista_venda_page.dart';
import 'package:pdv_elevati/app/modules/venda/pages/pagamento/pagamento_page.dart';
import 'package:pdv_elevati/app/modules/venda/pages/vender/vender_page.dart';
import 'venda_controller.dart';

class VendaPage extends StatefulWidget {
  final String title;
  const VendaPage({Key key, this.title = "Velo"}) : super(key: key);

  @override
  _VendaPageState createState() => _VendaPageState();
}

class _VendaPageState extends ModularState<VendaPage, VendaController> {
  //use 'controller' variable to access controller
  int _indiceAtual = 0; 

  @override
  void initState() {    
    super.initState();
    //controller.loadFromApi();    
    controller.listarProdutos();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      VenderPage(),
      ListaVendaPage(),
      PagamentoPage(),      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.blueGrey),),
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: (){
              print("acao: compras efetuadas");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("acao: pesquisa");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("acao: conta");
            },
          )
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        //fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.orange,              
              title: Text("Vender"),
              icon: Icon(Icons.add_shopping_cart,)
            ),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                title: Text("Compras"),
                icon: (controller.quantidadeProdutos > 0) 
                ? Badge(                  
                    shape: BadgeShape.square,
                    borderRadius: 100,
                    badgeColor: Colors.blue,
                    child: Icon(Icons.shopping_cart),
                    badgeContent: Container(
                      child: Text(controller.quantidadeProdutos.toString() , style: TextStyle(color: Colors.white),), 
                    ),
                  )
                : 
                  Icon(Icons.add_shopping_cart,),
            ),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                title: Text((controller.totalCompra > 0)
                            ?
                              controller.totalCompra.toString()
                            :
                              "Pagamento"                            
                          ),
                icon: Icon(Icons.attach_money)
            ),            
          ]
      ),
    );
  }
}
