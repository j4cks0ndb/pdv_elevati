import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:pdv_elevati/app/modules/venda/models/produto_grupo_model.dart';
import 'package:pdv_elevati/app/shared/db_repository.dart';

class ProdutoGrupoRepository extends DbRepository<ProdutoGrupo> with Disposable{

  atualizaTabela() async {
    var url = "http://54.233.230.74:8080/VeloService/listarProdutoGrupo";
    try {
      Response response = await Dio().get(url);
      return (response.data as List).map((produtoGrupo) {
      print('Inserting $produtoGrupo');
      atualizaDB(ProdutoGrupo.fromJson(produtoGrupo));
    }).toList();
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<List<ProdutoGrupo>> findAllByTipo(String produtoGrupo) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from ProdutoGrupos where grupo =? ',[produtoGrupo]);

    return list.map<ProdutoGrupo>((json) => fromJson(json)).toList();
  }

  

 
  @override
  // TODO: implement tableName
  String get tableName => "ProdutoGrupos";

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  ProdutoGrupo fromJson(Map<String, dynamic> map) {
    return ProdutoGrupo.fromJson(map);
  }

  
}
