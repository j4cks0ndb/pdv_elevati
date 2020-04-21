import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:pdv_elevati/app/modules/venda/models/produto_model.dart';
import 'package:pdv_elevati/app/shared/db_provider.dart';

class ProdutoRepository extends Disposable {


  Future<List<Produto>> getAllProdutos() async {
    return await DBProvider.db.getAllProdutos();    

  }

  Future<List<Produto>> syncProdutos() async {
    var url = "http://54.233.230.74:8080/VeloService/listarProduto";
    Response response = await Dio().get(url);

    return (response.data as List).map((produto) {
      print('Inserting $produto');
      DBProvider.db.createProduto(Produto.fromJson(produto));
    }).toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
