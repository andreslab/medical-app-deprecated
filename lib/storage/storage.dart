import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Storage {
  static late Database db;

  Storage._();

  static Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'medical.db');

    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE alarms (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              created_at TEXT NOT NULL,
              title TEXT,
              time TEXT,
              body TEXT
            );''');
        await db.execute('''CREATE TABLE records (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              created_at TEXT NOT NULL,
              diastolic INTEGER NOT NULL,
              systolic INTEGER NOT NULL,
              weight INTEGER,
              spo2 INTEGER,
              bpm INTEGER NOT NULL,
              doctor_id TEXT,
              client_id TEXT
          );''');
      },
      version: 1,
    );
  }

  Future<void> close() async {
    await db.close();
  }

  static Future<void> someDatabaseOperation() async {
    await db.insert('records', {
      'created_at': DateTime.now().toString(),
      'diastolic': 80,
      'systolic': 120,
      'bpm': 70,
      'client_id': 'me',
    });
    await db.insert('alarms', {
      'created_at': DateTime.now().toString(),
      'title': 'Title alarm',
      'time': '10:00PM',
      'body': 'Sample alarm body',
    });
  }
}
