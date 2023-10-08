import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:skill_test/model/produk_model.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'produk';
  static const columnId = 'id';
  static const columnNamaBarang = 'nama_barang';
  static const columnKodeBarang = 'kode_barang';
  static const columnJumlahBarang = 'jumlah_barang';
  static const columnTanggal = 'tanggal';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNamaBarang TEXT NOT NULL,
            $columnKodeBarang TEXT NOT NULL,
            $columnJumlahBarang INTEGER NOT NULL,
            $columnTanggal TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Produk produk) async {
    Database? db = await database;
    return await db!.insert(table, produk.toMap());
  }

  Future<Produk?> queryProduk(int id) async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query(table,
        columns: [
          columnId,
          columnNamaBarang,
          columnKodeBarang,
          columnJumlahBarang,
          columnTanggal
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Produk.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Produk>> queryAllProduk() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query(table, columns: [
      columnId,
      columnNamaBarang,
      columnKodeBarang,
      columnJumlahBarang,
      columnTanggal
    ]);
    return maps.map((e) => Produk.fromMap(e)).toList();
  }

  Future<int> update(Produk produk) async {
    Database? db = await database;
    return await db!.update(table, produk.toMap(),
        where: '$columnId = ?', whereArgs: [produk.id]);
  }

  Future<int> delete(int id) async {
    Database? db = await database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Produk>> searchProduk(String keyword) async {
    Database? db = await database;
    if (db == null) return [];
    List<Map<String, dynamic>> maps = await db.query(table,
        columns: [
          columnId,
          columnNamaBarang,
          columnKodeBarang,
          columnJumlahBarang,
          columnTanggal
        ],
        where: '$columnNamaBarang LIKE ?',
        whereArgs: ['%$keyword%']);
    return maps.map((e) => Produk.fromMap(e)).toList();
  }
}
