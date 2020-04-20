import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'vender_controller.g.dart';

class VenderController = _VenderControllerBase with _$VenderController;

abstract class _VenderControllerBase with Store {

  @observable
  List indice = [];

  @observable
  List<Widget> botoes = [];

  @action
  void listarProdutos({List produtos, bool voltar = false}){
    
    List<Widget> retorno = [];    
    if (produtos == null){      
      produtos = ["Bebidas", "Pereciveis", "Grupo 1", "Grupo 2"];
      for (var i = 0; i < produtos.length; i++) {
      retorno.add(RaisedButton(
                   onPressed: (){
                    listarProdutos(produtos: [produtos[i]]) ;               
                   }, 
                   child: Text(produtos[i]),
                   color: Color(0xff797ec2),  
                   padding: EdgeInsets.all(8),
                  )
                  );
      }
    }    
    if (voltar){
       botoes = indice; 
       return ;      
    }  
    
    indice = botoes;
    botoes = retorno;   
  }
}
