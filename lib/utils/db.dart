import 'dart:io';
import 'package:path/path.dart';
import 'package:fooddelivery/modles/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


final  DBUtils dbUtils = new DBUtils();
class DBUtils {
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT,"
          "user_id TEXT,"
          "password TEXT,"
          "address TEXT,"
          "phone_number TEXT"
          ")");

      await db.execute("CREATE TABLE Resturant ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "cordinate_x DOUBLE,"
          "cordinate_y DOUBLE,"
          "address TEXT,"
          ")");

      await db.execute("CREATE TABLE Order ("
          "id INTEGER PRIMARY KEY,"
          "user_id INTEGER,"
          "resturant_id INTEGER,"
          "status INTEGER,"
          "FOREIGN KEY(user_id) REFERENCES User(id)"
          "FOREIGN KEY(resturant_id) REFERENCES Resturant(id)"
          ")");
      

      await db.transaction((txn) async {
        int id1 = await txn.rawInsert(
            'INSERT INTO User(first_name, last_name, user_id, password, address, phone_number) VALUES("Dana", "Mizrahi" ,"dmirahi", "123456", "Harav Reines St 29", "0506884990")');
        print('inserted1: $id1');
      });
    });
  }

  getClientByUsername(username) async {
    var res = await database.then((value) => value.query("User", where: "user_id = ?", whereArgs: [username]));
    return res.isNotEmpty ? User.fromMap(res.first) : Null;
  }
}




