import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/cart.dart';

class DatabaseService {
  DatabaseService._init();
  static final instance = DatabaseService._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'cart.db');
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER, productPrice INTEGER, quantity INTEGER, unitTag TEXT, image TEXT)');
  }

  Future<Cart> insertItem(Cart cart) async {
    final db = await instance.database;
    await db.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<Cart>> getItemList() async {
    final db = await instance.database;
    final List<Map<String, Object?>> result = await db.query('cart');
    return result.map((value) => Cart.fromMap(value)).toList();
  }

  Future<int> updateQuantity(Cart cart) async {
    var db = await instance.database;
    return await db.update('cart', cart.quantityMap(),
        where: "productId = ?", whereArgs: [cart.id]);
  }

  Future<int> deleteItem(int id) async {
    var db = await instance.database;
    return await db.delete('cart', where: "id = ?", whereArgs: [id]);
  }

  Future close() async {
    var db = await instance.database;
    return await db.close();
  }
}
