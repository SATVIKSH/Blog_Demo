import 'package:blog/data/blog_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('blogs.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE blogs (
      id TEXT PRIMARY KEY,
      link TEXT,
      title TEXT,
      summary TEXT,
      image TEXT
    )
    ''');
  }

  Future<void> replaceBlogs(List<BlogModel> newBlogs) async {
    final db = await instance.database;
    await db.transaction((txn) async {
      await txn.delete('blogs');
      for (final blog in newBlogs) {
        await txn.insert(
          'blogs',
          blog.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<BlogModel>> fetchBlogs() async {
    final db = await instance.database;

    final result = await db.query('blogs');

    return result.map((map) => BlogModel.fromMap(map)).toList();
  }
}
