import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/model_todo.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            desc TEXT,
            category TEXT NOT NULL,
            status INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  // Tambah todo
  Future<int> insertTodo(ModelTodo todo) async {
    final client = await db;
    return client.insert('todos', todo.toMap());
  }

  // Ambil semua todo (bisa filter status)
  Future<List<ModelTodo>> getTodos({bool? completed}) async {
    final client = await db;
    String? where;
    List<Object?>? whereArgs;
    if (completed != null) {
      where = 'status = ?';
      whereArgs = [completed ? 1 : 0];
    }
    final result = await client.query(
      'todos',
      where: where,
      whereArgs: whereArgs,
      orderBy: 'id DESC',
    );
    return result.map((e) => ModelTodo.fromMap(e)).toList();
  }

  // Update todo
  Future<int> updateTodo(ModelTodo todo) async {
    final client = await db;
    return client.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  // Hapus todo
  Future<int> deleteTodo(int id) async {
    final client = await db;
    return client.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  // Optional: close db
  Future close() async {
    final client = await db;
    client.close();
  }
}
