import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shopping/screen/card/model/card_model.dart';
import 'package:shopping/screen/home/model/home_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{

  static DBHelper helper = DBHelper._();
  DBHelper._();

  Database? database;

  Future<Database> checkData() async {
    if(database != null){
      return database!;
    }else{
      return await initDb();
    }
  }


  Future<Future<Database>> initDb() async {
    Directory dir = await getApplicationSupportDirectory();
    String path = join(dir.path,"mySql.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String productQuary =
            "CREATE TABLE products (id INTEGER PRIMARY KEY AUTOINCREMENT,product TEXT,price TEXT,qua TEXT)";
        String cartQuary =
            "CREATE TABLE cart (id INTEGER PRIMARY KEY AUTOINCREMENT,product TEXT,price TEXT,qua TEXT)";
        db.execute(productQuary);
        db.execute(cartQuary);
      },
    );
  }

  Future<void> insertDb(dbModel model) async {
    database = await checkData();
    database!.insert(
      "cart",{
        "product":model.product,
      "price":model.price,
      "qua":model.qua,
    }
    );
  }

  Future<List<cartModel>> readDb() async {
    database = await checkData();
    String cardQuery="Select * From cart";
    List<Map> list = await database!.rawQuery(cardQuery);
    List<cartModel> l1 = list.map((e) => cartModel.mapToModel(e)).toList();
    return l1;
  }

  Future<void> delete(int id) async {
    database = await checkData();
    database!.delete("cart",where: "id=?",whereArgs: [id]);
  }

  Future<void> update(cartModel model) async {
    database = await checkData();
    database!.update("cart", {
      "product":model.product,
      "price":model.price,
      "qua":model.qua,
    });
  }
}