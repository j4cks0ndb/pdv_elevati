import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pdv_elevati/app/modules/venda/models/produto_model.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_repository.dart';

part 'venda_controller.g.dart';

class VendaController = _VendaControllerBase with _$VendaController;

abstract class _VendaControllerBase with Store {
  final ProdutoRepository _produtoRepository;
  _VendaControllerBase(this._produtoRepository);

  @observable
  int quantidadeProdutos = 26;

  @observable
  double totalCompra = 225.96;

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
  Future<void> listarProdutos({int produto, bool voltar = false}) async {
    Map<int, String> produtos = new Map<int, String>();
    List<Widget> retorno = [];
    List<Produto> prod = await _produtoRepository.findAll();

    if (voltar) {
      if (indice.length > 1) {
        produto = indice.last;
        indice.removeLast();
      } else {
        produto = null;
      }
    }

    if (produto == null) {
      //_produtos.then((prod) {
        prod.forEach((prd) {
          if((prd.produtoId != null) && (prd.produto != null)){
            produtos.putIfAbsent(prd.produtoId,() => prd.produto);  
          }
          
        });
      //});
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

    if (produtos != null) {
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

  Future loadFromApi() async {
    await _produtoRepository.atualizaTabela();
  }
}
