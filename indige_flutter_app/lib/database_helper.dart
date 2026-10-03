import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'purhe_dict.db');

    if (!await File(path).exists()) {
      // make sure the databases folder exists
      await Directory(dirname(path)).create(recursive: true);

      ByteData data = await rootBundle.load('assets/db/purhe_dict.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      print('Copied database to $path');
    }

    return await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getAllEntries() async {
    final db = await instance.database;
    return await db.query('purhepecha_dictionary');
  }
}