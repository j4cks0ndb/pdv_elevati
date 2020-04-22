import 'dart:async';
import 'package:pdv_elevati/app/shared/db_entity.dart';
import 'package:pdv_elevati/app/shared/db_helper.dart';
import 'package:sqflite/sqflite.dart';

// Data Access Object
abstract class DbRepository<T extends DbEntity>{

  Future<Database> get db => DbHelper.getInstance().db;

  String get tableName;

  T fromJson(Map<String,dynamic> map);

  Future<int> atualizaDB(T entity) async {
    await deleteAll();    
    return await save(entity);
  }  

  Future<int> save(T entity) async {
    var dbClient = await db;
    var id = await dbClient.insert(tableName, entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<T>> findAll() async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from $tableName');

    return list.map<T>((json) => fromJson(json)).toList();
  }

  Future<T> findById(int id) async {
    var dbClient = await db;
    final list =
        await dbClient.rawQuery('select * from $tableName where id = ?', [id]);

    if (list.length > 0) {
      return fromJson(list.first);
    }

    return null;
  }

  Future<bool> exists(int id) async {
    T c = await findById(id);
    var exists = c != null;
    return exists;
  }

  Future<int> count() async {
    final dbClient = await db;
    final list = await dbClient.rawQuery('select count(*) from $tableName');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $tableName where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $tableName');
  }

}