import 'dart:developer';

import 'package:nipp/mongo_dart.dart';
import 'package:nipp/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
 static late DbCollection userCollection;
  static late Db db;
  static Future<String> insertData(Map<String, dynamic> document) async {
    try {
      await userCollection.insertOne(document);
      return "Data Inserted";
    } catch (e) {
      print(e.toString());
      return "Something Wrong while inserting data";
    }
  }
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);

}
  
}

