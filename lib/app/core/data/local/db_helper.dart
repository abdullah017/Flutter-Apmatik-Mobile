// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:apmatik/app/core/model/credit_card_model.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = p.join(dbFolder, "cards.db");
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    return await db.execute(
        "CREATE TABLE cards(id INTEGER PRIMARY KEY, cardHolder TEXT, cardNumber TEXT, cardExpriyDate TEXT,cardCvv TEXT, selected INTEGER)");
  }

  // Future deleteTable() async {
  //   var dbClient = await db;
  //   var result = await dbClient.delete(
  //     "cards",
  //   );
  //   print('TABLO SİLİNDİ');
  //   return result;
  // }

  Future<List<CreditCard>> getCreditCards() async {
    var dbClient = await db;
    var result = await dbClient.query("cards", orderBy: "id");
    return result.map((data) => CreditCard.fromMap(data)).toList();
  }

  Future<int> insertCreditCard(CreditCard contact) async {
    var dbClient = await db;
    return await dbClient.insert("cards", contact.toMap());
  }

  Future<int> updateCreditCard(CreditCard contact) async {
    var dbClient = await db;
    return await dbClient.update("cards", contact.toMap(),
        where: "id=?", whereArgs: [contact.id]);
  }

  Future<int> removeCreditCard(int id) async {
    var dbClient = await db;
    return await dbClient.delete("cards", where: "id=?", whereArgs: [id]);
  }
}
