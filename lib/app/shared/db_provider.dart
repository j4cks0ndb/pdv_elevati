import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdv_elevati/app/modules/venda/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'pdv.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Produtos('
          'produtoId INTEGER PRIMARY KEY,'
          'produtoGrupoId INTEGER,'
          'codBarras TEXT,'
          'precoVenda REAL,'
          'produto TEXT,'
          'isAtivo INTEGER'
          ')');
    });
  }

  // Insert employee on database
  createProduto(Produto novoProduto) async {
    await deleteAllProdutos();
    final db = await database;
    final res = await db.insert('Produtos', novoProduto.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllProdutos() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Produtos');

    return res;
  }

  Future<List<Produto>> getAllProdutos() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM PRODUTOS");

    List<Produto> list =
        res.isNotEmpty ? res.map((c) => Produto.fromJson(c)).toList() : [];

    return list;
  }
}