import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionaryappwith_bloc/Model/bookmarks_model.dart';

class BookMarkRepo {
  static Future userAddEntery(String collection, Bookmarks bookmarks) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .add(bookmarks.toJson());
  }

  static Future deleteEntery(String docId, String collection) async {
    await FirebaseFirestore.instance.collection(collection).doc(docId).delete();
  }
}
