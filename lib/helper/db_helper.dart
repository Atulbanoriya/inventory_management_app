import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> registerUser(String email, String password) async {
    final db = await database;
    try {
      return await db.insert(
        'users',
        {'email': email, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      return -1; // Indicates a duplicate user or error
    }
  }

  Future<bool> isUserExists(String email) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  /// Login Function Logic
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      final user = result.first;
      if (user['password'] == password) {
        return user;
      }
    }
    return null; // No user found or incorrect password
  }

}

