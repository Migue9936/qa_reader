

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qa_reader/models/scan_model.dart';
export 'package:qa_reader/models/scan_model.dart';

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';


class DBProvider {
  
  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async{
    if (_database !=null) return _database;

    _database = await initDB();

    return _database;
  }


  Future<Database?> initDB()async{

    //Path where whe save or create the DB
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path,'ScansDB.db');
    //Create DB

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, version) async {
        await db.execute('''
           CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
           )

        ''');
      },
    );

  }

  newScan(ScanModel newScan) async{
    final db = await database;
    final response = await db?.insert('Scans',newScan.toJson() );
    // Register ID
    return response;

  }

  Future<ScanModel?> getScanById(int id) async {
      final db = await database;
      final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);
  
      return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
    }

     Future<List<ScanModel>?> getScanByType(String type) async {
      final db = await database;
      final res = await db!.rawQuery('''SELECT * FROM Scans WHERE type = $type''');
  
      return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : null;
    }

    Future<List<ScanModel>?> getScans() async {
      final db = await database;
      final res = await db!.query('Scans');

      return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList(): null;
    }

  Future<int?> updateScan(ScanModel newScan)async{
    final db = await database;
    final res = await db!.update('Scans', newScan.toJson(),where: 'id =?',whereArgs: [newScan.id]);
    return res;
  }
  

  Future<int?> deleteScan(int id) async{

    final db = await database;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;

  }

  Future<int?> deleteAllScan() async{

    final db = await database;
    final res = await db!.delete('Scans');
    return res;

  }

}