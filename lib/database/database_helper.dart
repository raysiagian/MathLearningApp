import 'package:path_provider/path_provider.dart';
import 'package:projectapp/models/usermodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "mathapp.db";

  static Future<Database>_getDB() async{
    return openDatabase(join(await getDatabasesPath(),_dbName),
    onCreate: (db, version) async =>
    await db.execute(
        '''
          CREATE TABLE users (
            id BIGINT UNSIGNED PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            email_verified_at TIMESTAMP NULL DEFAULT NULL,
            password VARCHAR(255) NOT NULL,
            gender VARCHAR(255) NOT NULL,
            remember_token VARCHAR(100) DEFAULT NULL,
            created_at TIMESTAMP NULL DEFAULT NULL,
            updated_at TIMESTAMP NULL DEFAULT NULL
          )
        '''
      )
    );
  }

  static Future<int> addUser(UserModel user) async{
    final db = await _getDB();
    return await db.insert("users", user.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUser( UserModel user)async{
    final db = await _getDB();
    return await db.update("users", user.toJson(),where: 'id = ?', whereArgs: [user.id], conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUser( UserModel user)async{
  final db = await _getDB();
  return await db.delete("users", 
      where: 'id = ?', 
      whereArgs: [user.id],
    );
  }
}