import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';
import 'package:grocery_app_flutter/modals/list.dart';

class homepgprovider extends ChangeNotifier {
  String searchQuery = '';

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

  // can use normal func here too both work, here we are using a getter
  double get totalPrice {
    double total = 0;
    for (var item in allProduct) {
      total += double.parse(item.price.replaceAll('\$', '')) * item.quantity;
    }
    return total;
  }

  List<Productcards> get cartItems {
    return allProduct.where((item) => item.quantity > 0).toList();
    // bascially using this logic we are taking all the elemets from allProduct (the super list having all other list), and we are filtering using .where() where we are selecting items from the list having quantity > 0 only that item is passed to the next page (i.e viewpg)
    // ex: Apple      quantity = 2         after filter
    // Banana     quantity = 0              Apple
    //  Mango      quantity = 1             Mango
    // Orange     quantity = 0
  }

  int get cartCount {
    return allProduct.where((item) => item.quantity > 0).length;
  }

  void updateSearch(String value) {
    searchQuery = value;
    notifyListeners();
  }

  List<Productcards> get filterProduct {
    if (searchQuery.isEmpty) {
      return allProduct;
    }
    return allProduct.where((item) {
      return item.desc.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }
}
