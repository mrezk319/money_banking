import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'Bank.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Users(id TEXT PRIMARY KEY NOT NULL, name TEXT NOT NULL, email TEXT NOT NULL, phone TEXT NOT NULL, country TEXT NOT NULL, balance DOUBLE NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Transfers(sender TEXT NOT NULL, receiver TEXT NOT NULL, balance DOUBLE NOT NULL )",
        );
      },
      version: 1,
    );
  }
}