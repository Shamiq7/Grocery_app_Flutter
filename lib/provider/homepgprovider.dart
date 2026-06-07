import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';
import 'package:grocery_app_flutter/modals/list.dart';

class homepgprovider extends ChangeNotifier {
  void addtocart(Productcards item) {
    item.quantity++;

    notifyListeners();
  }

  void removefromcart(Productcards item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      item.quantity = 0;
    }
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in allProduct) {
      total += double.parse(item.price.replaceAll('\$', '')) * item.quantity;
    }
    return total;
  }
}
