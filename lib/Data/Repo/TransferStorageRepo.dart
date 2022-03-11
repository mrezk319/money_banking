import 'package:banking_app/Data/Database/LocalStorage.dart';
import 'package:banking_app/Data/Models/Transfers.dart';
import 'package:sqflite/sqflite.dart';

class TransferDatabaseRepo
{
  final DatabaseHandler _databaseHandler;

  TransferDatabaseRepo(this._databaseHandler);
  Future<List<Transfer>> retrieveItems() async {
    final Database db = await _databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Transfers');
    return queryResult.map((e) => Transfer.fromJson(e)).toList();
  }

  Future<void> insertItem(Transfer transfer) async {
    final Database db = await _databaseHandler.initializeDB() ;
    await db.insert('Transfers', transfer.toJson());
  }

  Future<void> deleteItem(String id) async {
    final db = await _databaseHandler.initializeDB();
    await db.delete(
      'Transfers',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}