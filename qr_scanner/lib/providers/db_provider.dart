import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "ScansDB.db");
    print("Ruta de la base de datos: $path");

    // Crear DB
    return await openDatabase(
      path, 
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      }
    );
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int i) async {
    final db = await database;
    final res = await db.query("Scans", where: "id = ?", whereArgs: [i]);

    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

  Future<List<ScanModel>?> getTodosLosScans() async {
    final db = await database;
    final res = await db.query("Scans");

    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<List<ScanModel>?> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toMap(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
  }

}