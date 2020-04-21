import 'dart:convert';

List<Produto> employeeFromJson(String str) =>
    List<Produto>.from(json.decode(str).map((x) => Produto.fromJson(x)));

String employeeToJson(List<Produto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produto {
  int produtoId;
  int produtoGrupoId;
  String codBarras;
  double precoVenda;
  String produto;
  int isAtivo;
  

  Produto({
    this.produtoId,
    this.produtoGrupoId,
    this.codBarras,
    this.precoVenda,
    this.produto,
    this.isAtivo,
  });

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        produtoId: json["produtoId"],
        produtoGrupoId: json["produtoGrupoId"],
        codBarras: json["codBarras"],
        precoVenda: json["precoVenda"],
        produto: json["produto"],
        isAtivo: json["isAtivo"],
      );

  Map<String, dynamic> toJson() => {
        "produtoId": produtoId,
        "produtoGrupoId": produtoGrupoId,
        "codBarras": codBarras,
        "precoVenda": precoVenda,
        "produto": produto,
        "isAtivo": isAtivo
      };
}