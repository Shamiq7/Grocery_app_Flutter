import 'package:flutter/material.dart';

class Productcards {
  final String price;
  final String desc;
  final Image img;
  final String weight;
  int quantity = 0;

  Productcards({
    required this.desc,
    required this.img,
    required this.price,
    required this.weight,
    this.quantity = 0,
  });
}
