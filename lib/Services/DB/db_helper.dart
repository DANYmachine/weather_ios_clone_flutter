import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

final String table = 'notes';

class Fields {
  static final List<String> values = [
    id,
    city,
  ];

  static final String id = '_id';
  static final String city = 'city';
}

class NotesDb {
  static final NotesDb instance = NotesDb._init();
  static Database? _database;
  NotesDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
      CREATE TABLE $table(
        ${Fields.id} $idType,
        ${Fields.city} $textType
      )
    ''');
  }

  Future<City> create(City note) async {
    final db = await instance.database;
    final id = await db.insert(table, note.toJson());

    return note.copy(id: id);
  }

  Future<City> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      table,
      columns: Fields.values,
      where: '${Fields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return City.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<City>> readAll() async {
    final db = await instance.database;
    final result = await db.query(table);

    return result.map((json) => City.fromJson(json)).toList();
  }

  Future<int> update(City note) async {
    final db = await instance.database;
    return db.update(
      table,
      note.toJson(),
      where: '${Fields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      table,
      where: '${Fields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
