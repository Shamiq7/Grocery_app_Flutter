import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//this func reads data from firestore
addtoDB(
  String desc,
  String price,
  String weight,
  String imagepath,
  
) async {
  final docRef = await FirebaseFirestore.instance.collection('products').add({
  
    'desc': desc,
    'price': price,
    'weight': weight,
    'imagePath': imagepath,
    'quantity': 0,
  });
  print('///////////////DATABASE UPDATED/////////////////');
  return docRef;
}

//we want firestore to become a single source of truth ie we need to dispay products only added inside the database, so we create another func

//this func loads data from the database
//...doc.data() means firestore will give everything that it has in it desc,imagepath,price,quantity,weight etc if there is
Future<List<Map<String, dynamic>>> getProducts() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('products')
      .get();

  return snapshot.docs.map((doc) {
    return {'id': doc.id, ...doc.data() as Map<String, dynamic>};
  }).toList();
}

Future deletfromDB(String docID) async {
  await FirebaseFirestore.instance.collection('products').doc(docID).delete();
}







// Firestore
//    ↓
// getProducts()
//    ↓
// [
//   {
//     id,
//     desc,
//     price,
//     weight,
//     imagePath
//   }
// ]

// once we have the data we can use addtoDB, delete, update from the DB itself because we are getting data from the database
//    ↓
// Provider
//    ↓
// Home Page
// Admin Page
// Checkout Page