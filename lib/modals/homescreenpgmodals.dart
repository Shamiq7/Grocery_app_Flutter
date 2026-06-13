import 'package:flutter/material.dart';

class Productcards {
  final String price;
  final String desc;
  final Image img;
  final String weight;
  String? id;
 String? catagory;
  int quantity;

  Productcards({
    this.catagory,
    this.id,
    required this.desc,
    required this.img,
    required this.price,
    required this.weight,
    this.quantity = 0,
  });
}
