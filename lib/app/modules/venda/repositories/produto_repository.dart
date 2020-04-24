import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:pdv_elevati/app/modules/venda/models/produto_model.dart';
import 'package:pdv_elevati/app/shared/db_repository.dart';

class ProdutoRepository extends DbRepository<Produto> with Disposable{

  Future atualizaTabela() async {    
    var url = "http://54.233.230.74:8080/VeloService/listarProduto";    
    try {
      Response response = await Dio().get(url);      
      var lista = response.data as List;
      
      lista.forEach((item) async {
        await atualizaDB(Produto.fromJson(item));
      });      
    } catch (e) {
      print(e.message);      
    }
  }

  Future<List<Produto>> findAllByProduto(String produto) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from produtos where produto =? ',[produto]);

    return list.map<Produto>((json) => fromJson(json)).toList();
  }

  Future<List<Produto>> findAllByProdutoGrupoId(int produtoGrupoId) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from Produtos where produtoGrupoId =? ',[produtoGrupoId]);

    return list.map<Produto>((json) => fromJson(json)).toList();
  }
  

 
  @override
  // TODO: implement tableName
  String get tableName => "Produtos";

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Produto fromJson(Map<String, dynamic> map) {
    return Produto.fromJson(map);
  }

  
}
