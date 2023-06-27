import 'dart:async';

import 'package:contacts_app/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static late Future<Database> _database;
  static const String CONTACTS_TABLE = "Contacts";

  static void initialize() async {
    _database = openDatabase(
        join(await getDatabasesPath(), 'contactDatabase.db'),
        version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE CONTACTS(id INTEGER PRIMARY KEY, name TEXT, number TEXT)',
      );
    });
  }

  static void insert(Contact contact) async {
    final db = await _database;

    await db.insert(CONTACTS_TABLE, contact.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Contact>> contacts() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(CONTACTS_TABLE);

    return List.generate(maps.length, (i) {
      return Contact(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['number'],
      );
    });
  }

  static Future<bool> deleteContact(Contact contact) async {
    final db = await _database;

    return await db.delete(
          CONTACTS_TABLE,
          where: 'id = ?',
          whereArgs: [contact.id],
        ) >
        0;
  }
}
