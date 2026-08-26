import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 class DatabaseServices{


  static Future<void> addData(String title, String detail)async{
    await firebaseFirestore.collection('notes').add({
      "title": title,
      "detail": detail
    }).whenComplete(()=> print('add success')).catchError((e){
      print(e.toString());
      });

  }
  static Future<void> deleteData(String id)async{
    await firebaseFirestore.collection("notes").doc(id).delete();
  }
  static Future<void> updateData(String id, String title, String detail)async{
    await firebaseFirestore.collection('notes').doc(id).update({
      "detail": detail,
      "title": title,
    });
  }
 }