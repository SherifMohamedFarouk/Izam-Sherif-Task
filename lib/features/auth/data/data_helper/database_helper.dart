import 'package:izam_sherif_flutter_task/features/auth/data/models/login_model.dart';
import 'package:sqflite/sqflite.dart' as sql;


class DatabaseHelper {
  // init the data base
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'user.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }
  // create the data base table for users email and password
static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        email TEXT,
        password TEXT,
        login_count INTEGER
      )
      """);
  }

  // create the first item
  static Future<int> createItem(LoginModel data) async {
    final db = await DatabaseHelper.db();
    final id = await db.insert('items', data.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;

  }
  // Check if email exist and if password match this email to connect to pairs.
  static Future<String> doesEmailExist(String email,password) async {
    String message = "";
    try{
      final db = await DatabaseHelper.db();
      List<Map<String, dynamic>>count = await db.query('items', where: "email = ? AND password = ?", whereArgs: [email, password], limit: 1);
      if(count.isNotEmpty){
        await updateItem(LoginModel(email:email ,loginCount: count.first['login_count']+1,password:password));
        message = "You have logged in with this pair of $email and $password this number of ${count.first['login_count']+1} times";
      }else{
        await DatabaseHelper.createItem(
            LoginModel(email:email ,loginCount: 1,password:password));
        message = "You have logged in with this pair of $email and $password this number of 1 times";
      }
      return message;
    }catch(error){
      rethrow;
    }
  }

  // Update an item by email
  static Future<int> updateItem(LoginModel data) async {
    final db = await DatabaseHelper.db();
    final result = await db.update('items', data.toMap(), where: "email = ? AND password = ?", whereArgs: [data.email,data.password]);
    return result;
  }

}