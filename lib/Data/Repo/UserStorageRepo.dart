import 'package:banking_app/Data/Database/LocalStorage.dart';
import 'package:banking_app/Data/Models/User.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseRepo
{
  final DatabaseHandler _databaseHandler;

  UserDatabaseRepo(this._databaseHandler);
  Future<List<User>> retrieveItems() async {
    final Database db = await _databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Users');
    return queryResult.map((e) => User.fromJson(e)).toList();
  }

  Future<void> insertItems() async {
    final Database db = await _databaseHandler.initializeDB() ;
    await db.insert('Users', User(id: "0", name: "Muhammed Rezk", email: "Rezk@gmail.com", phone: "01280609696", country: "Egypt", balance: 600).toJson());
    await db.insert('Users', User(id: "1", name: "Mahmoudd Shaker", email: "Shaker@gmail.com", phone: "01280609696", country: "England", balance: 5500).toJson());
    await db.insert('Users', User(id: "2", name: "Mahmoudd Kamal", email: "Kamalll@gmail.com", phone: "01280609696", country: "Denmark", balance: 1000).toJson());
    await db.insert('Users', User(id: "3", name: "Samyy", email: "Hary@gmail.com", phone: "01280609696", country: "Angola", balance: 5010).toJson());
    await db.insert('Users', User(id: "4", name: "Mohamed Saleh", email: "SalehH@gmail.com", phone: "0123456789", country: "USA", balance: 260).toJson());
    await db.insert('Users', User(id: "5", name: "Mangrr", email: "Mangrr_h@gmail.com", phone: "0147896325", country: "Spain", balance: 365).toJson());
    await db.insert('Users', User(id: "6", name: "Farah", email: "Farah@gmail.com", phone: "0258963147", country: "France", balance: 3001).toJson());
    await db.insert('Users', User(id: "7", name: "Nour", email: "Nourr@gmail.com", phone: "0256314799", country: "Italy", balance: 8900).toJson());
    await db.insert('Users', User(id: "8", name: "Sarah", email: "Sarah45@gmail.com", phone: "0256314987", country: "England", balance: 7600).toJson());
  }

  Future<void> deleteItem(String id) async {
    final db = await _databaseHandler.initializeDB();
    await db.delete(
      'User',
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<void> updateItem(String text,String id) async {
    final db = await _databaseHandler.initializeDB();
    await db.rawUpdate('UPDATE Users SET balance = ? WHERE id = ?', [text, id]);
  }
}