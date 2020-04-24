// To parse this JSON data, do
//
//     final vendaProduto = vendaProdutoFromJson(jsonString);

import 'dart:convert';

import 'package:pdv_elevati/app/shared/db_entity.dart';

class VendaProduto extends DbEntity {
    final int vendaId;
    final int produtoId;
    final String descricao;
    final double quantidade;
    final double precoUnitario;
    final double valorTotal;

    VendaProduto({
        this.vendaId,
        this.produtoId,
        this.descricao,
        this.quantidade,
        this.precoUnitario,
        this.valorTotal,
    });

    VendaProduto copyWith({
        int vendaId,
        int produtoId,
        String descricao,
        double quantidade,
        int precoUnitario,
        double valorTotal,
    }) => 
        VendaProduto(
            vendaId: vendaId ?? this.vendaId,
            produtoId: produtoId ?? this.produtoId,
            descricao: descricao ?? this.descricao,
            quantidade: quantidade ?? this.quantidade,
            precoUnitario: precoUnitario ?? this.precoUnitario,
            valorTotal: valorTotal ?? this.valorTotal,
        );

    factory VendaProduto.fromJson(String str) => VendaProduto.fromMap(json.decode(str));

    String toMap() => json.encode(toJson());

    factory VendaProduto.fromMap(Map<String, dynamic> json) => VendaProduto(
        vendaId: json["vendaId"],
        produtoId: json["produtoId"],
        descricao: json["descricao"],
        quantidade: json["quantidade"].toDouble(),
        precoUnitario: json["precoUnitario"].toDouble(),
        valorTotal: json["valorTotal"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "vendaId": vendaId,
        "produtoId": produtoId,
        "descricao": descricao,
        "quantidade": quantidade,
        "precoUnitario": precoUnitario,
        "valorTotal": valorTotal,
    };
}
