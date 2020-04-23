import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pdv_elevati/app/modules/venda/models/produto_model.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_grupo_repository.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_repository.dart';

import 'models/produto_grupo_model.dart';

part 'venda_controller.g.dart';

class VendaController = _VendaControllerBase with _$VendaController;

abstract class _VendaControllerBase with Store {
  final ProdutoRepository _produtoRepository;
  final ProdutoGrupoRepository _produtoGrupoRepository;
  _VendaControllerBase(this._produtoRepository, this._produtoGrupoRepository);

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
  setBotoes(List<Widget> value) {
    botoes = value;
  }

  @action
  Future<void> venderProduto({int produto, bool voltar = false}) async {

  }

  @action
  Future<void> listarProdutos({int produto, bool voltar = false}) async {
    Map<int, String> mgrupo = new Map<int, String>();
    Map<int, String> mproduto = new Map<int, String>();
    List<Produto> prod;
    List<ProdutoGrupo> grupo;
    List<Widget> _botoes = [];

    if (voltar) {
      if (indice.length > 1) {
        produto = indice.last;
        indice.removeLast();
      } else {
        produto = null;
      }
    }

    if (produto == null) {
      botoes.clear();
      grupo = await _produtoGrupoRepository.findAllByGrupoPaiId(0);
      grupo.forEach((item) {
        if ((item.produtoGrupoId != null) && (item.grupo != null)) {
          mgrupo.putIfAbsent(item.produtoGrupoId, () => item.grupo);
        }
      });
      indice.clear();
      _botoes = montaRetorno(mgrupo, "Grupo");

      prod = await _produtoRepository.findAllByProdutoGrupoId(0);
      prod.forEach((item) {
        if ((item.produtoId != null) && (item.produtoId != null)) {
          mproduto.putIfAbsent(item.produtoId, () => item.produto);
        }
      });
      _botoes.addAll(montaRetorno(mproduto, "Produto"));
    } else {
      prod = await _produtoRepository.findAllByProdutoGrupoId(produto);
      prod.forEach((item) {
        if ((item.produtoId != null) && (item.produtoId != null)) {
          mproduto.putIfAbsent(item.produtoId, () => item.produto);
        }
      });
      _botoes = montaRetorno(mproduto, "Produto");

      grupo = await _produtoGrupoRepository.findAllByGrupoPaiId(produto);
      grupo.forEach((item) {
        if ((item.produtoGrupoId != null) && (item.grupo != null)) {
          mgrupo.putIfAbsent(item.produtoGrupoId, () => item.grupo);
        }
      });
      _botoes.addAll(montaRetorno(mgrupo, "Grupo"));

      if (!voltar) {
        indice.add(produto);
      }
    }

    botoes = _botoes;
  }

  List<Widget> montaRetorno(Map<int, String> lista, String tipo) {
    List<Widget> retorno = [];

    lista.forEach((id, nome) {
      switch (tipo) {
        case "Produto":
          {
            retorno.add(RaisedButton(
              onPressed: () {
                venderProduto(produto: id);
              },
              child: Text(nome),
              color: Color(0xffc8a9d7),
              padding: EdgeInsets.all(8),
            ));
          }
          break;
        case "Grupo":
          {
            retorno.add(RaisedButton(
              onPressed: () {
                listarProdutos(produto: id);
              },              
              child: Text(nome),
              color: Color(0xff7076cb),
              padding: EdgeInsets.all(8),
            ));
          }
          break;
        default:
          {
            null;
          }
          break;
      }
    });
    return retorno;
  }

  Future loadFromApi() async {
    await _produtoRepository.atualizaTabela();
  }
}
