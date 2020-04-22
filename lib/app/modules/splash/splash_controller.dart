import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_grupo_repository.dart';
import 'package:pdv_elevati/app/modules/venda/repositories/produto_repository.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final ProdutoRepository _produtoRepository;
  final ProdutoGrupoRepository _produtoGrupoRepository;

  _SplashControllerBase([this._produtoRepository,this._produtoGrupoRepository]);

  Future<bool> loadProdutoFromApi() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _produtoRepository.atualizaTabela();
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }

  Future<bool> loadProdutoGrupoFromApi() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _produtoGrupoRepository.atualizaTabela();
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }
}
