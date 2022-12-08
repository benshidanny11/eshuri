import 'package:erangaapp/models/Product.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../models/Cart.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE cart(
        id INTEGER PRIMARY KEY NOT NULL,
        title TEXT,
        price TEXT,
        description TEXT,
        image TEXT,
        category TEXT,
        quantitiy INTEGER,
        totalprice DOUBLE,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'eranga.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(Cart cart) async {
    final db = await SQLHelper.db();
    final data = {
      'id': cart.id,
      'title': cart.title,
      'price': cart.price,
      'description': cart.description,
      'image': cart.image,
      'category': cart.category,
      'quantitiy': cart.quatity,
      'totalprice': double.parse(cart.price) * cart.quatity
    };
    final id = await db.insert('cart', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Cart>> getItems() async {
    final db = await SQLHelper.db();
    List<Cart> carts = [];
    final data = await db.query('cart', orderBy: "id");
    data.forEach((cart) {
      carts.add(Cart(
          id: int.parse(cart['id'].toString()),
          title: cart['title'].toString(),
          description: cart['description'].toString(),
          image: cart['image'].toString(),
          price: cart['price'].toString(),
          category: cart['category'].toString(),
          quatity: int.parse(cart['quantitiy'].toString()),
          totalprice: double.parse(cart['totalprice'].toString())));
    });
    return carts;
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('cart', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(Cart cart) async {
    final db = await SQLHelper.db();

    final data = {
      'title': cart.title,
      'price': cart.price,
      'description': cart.description,
      'image': cart.image,
      'category': cart.category,
      'quantitiy': cart.quatity,
      'totalprice': cart.totalprice
    };

    final result =
        await db.update('cart', data, where: "id = ?", whereArgs: [cart.id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("cart", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

   static deleteAll() async {
    final db = await SQLHelper.db();
    return await db.rawDelete("Delete from cart");
  }
}
