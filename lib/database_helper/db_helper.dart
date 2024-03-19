import 'dart:async';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/resume_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'resume_database.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE resume_data(id INTEGER PRIMARY KEY, name TEXT, email TEXT, contact TEXT, experiences TEXT, projects TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertResumeData(ResumeData resumeData) async {
    final Database db = await database;

    await db.insert(
      'resume_data',
      {
        'name': resumeData.name,
        'email': resumeData.email,
        'contact': resumeData.contact,
        'experiences': jsonEncode(resumeData.experiences),
        'projects': jsonEncode(resumeData.projects),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ResumeData>> getAllResumes() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('resume_data');

    return List.generate(maps.length, (i) {
      return ResumeData(
        name: maps[i]['name'],
        email: maps[i]['email'],
        contact: maps[i]['contact'],
        experiences: _parseJsonList(maps[i]['experiences']),
        projects: _parseJsonList(maps[i]['projects']),
      );
    });
  }

  List<Map<String, String>> _parseJsonList(String jsonString) {
    List<Map<String, dynamic>> list = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    List<Map<String, String>> result = [];
    for (var item in list) {
      Map<String, String> stringMap = {};
      item.forEach((key, value) {
        stringMap[key] = value.toString();
      });
      result.add(stringMap);
    }
    return result;
  }




}
