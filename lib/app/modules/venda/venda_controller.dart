import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pdv_elevati/app/modules/venda/models/produto_model.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_repository.dart';

part 'venda_controller.g.dart';

class VendaController = _VendaControllerBase with _$VendaController;

abstract class _VendaControllerBase with Store {

  final ProdutoRepository _produtoRepository;
  _VendaControllerBase(this._produtoRepository);

  Future loadFromApi() async{
    await _produtoRepository.getAllProdutos();
    listarProdutos();
  }

  @observable
  int quantidadeProdutos = 0;

  @observable
  double totalCompra = 0;

  @observable
  List indice = [];

  @observable
  List<Widget> botoes = [];

  @action
  void setQuantidadeProdutos(int valor) {
    quantidadeProdutos += valor;
  }

  @action
  void setTotalCompra(double valor) {
    totalCompra += valor;
  }

  @action
  void listarProdutos({int produto, bool voltar = false}) {
    Map<int, String> produtos;
    List<Widget> retorno = [];
    Future<List<Produto>> _produtos = _produtoRepository.getAllProdutos();    

    if (voltar) {
      if (indice.length > 1) {
        produto = indice.last;
        indice.removeLast();
      } else {
        produto = null;
      }
    }

    if (produto == null) {
      _produtos.then((prod){
        prod.forEach((prd){
          produtos.addAll({prd.produtoId:"$prd.produto"});
        });
      });
      indice.clear();
    } else {
      produtos = {
        1: "BebidasX",
        2: "PereciveisX",
        3: "Grupo 1X",
        4: "Grupo 2X"
      };
      if (!voltar) {
        indice.add(produto);
      }
    }

    produtos.forEach((id, nome) {
      retorno.add(RaisedButton(
        onPressed: () {
          listarProdutos(produto: id);
        },
        child: Text(nome),
        color: Color(0xff797ec2),
        padding: EdgeInsets.all(8),
      ));
    });
    botoes = retorno;
  }
}
