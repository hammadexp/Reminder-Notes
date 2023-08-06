
import 'package:flutter_app_4/models/reminder.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'your_app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE reminder_form (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');
  }

  // Insert a new form data into the database
  Future<void> insertFormData(ReminderForm formData) async {
    final db = await instance.database;
    await db.insert('reminder_form', formData.toMap());
  }

  // Retrieve all form data from the database
  Future<List<ReminderForm>> getAllFormData() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('reminder_form');
    return List.generate(maps.length, (i) {
      return ReminderForm.fromMap(maps[i]);
    });
  }
}