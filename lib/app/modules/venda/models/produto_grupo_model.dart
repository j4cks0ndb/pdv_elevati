import 'dart:convert';

import 'package:pdv_elevati/app/shared/db_entity.dart';

List<ProdutoGrupo> produtoGrupoFromJson(String str) =>
    List<ProdutoGrupo>.from(json.decode(str).map((x) => ProdutoGrupo.fromJson(x)));

String produtoToJson(List<ProdutoGrupo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProdutoGrupo extends DbEntity {  
  int produtoGrupoId;
  int produtoGrupoPaiId;
  String grupo;
  int isAtivo;
  

  ProdutoGrupo({
    this.produtoGrupoId,
    this.produtoGrupoPaiId,
    this.grupo,
    this.isAtivo,
  });

  factory ProdutoGrupo.fromJson(Map<String, dynamic> json) => ProdutoGrupo(
        produtoGrupoId: json["produtoGrupoId"],
        produtoGrupoPaiId: json["produtoGrupoPaiId"],
        grupo: json["grupo"],
        isAtivo: json["isAtivo"]
      );

  Map<String, dynamic> toJson() => {
        "produtoGrupoId": produtoGrupoId,
        "produtoGrupoPaiId": produtoGrupoPaiId,
        "grupo": grupo,
        "isAtivo": isAtivo
      };
}