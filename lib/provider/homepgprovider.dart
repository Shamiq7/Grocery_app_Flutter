import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/functions/firestorefunc.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';
import 'package:grocery_app_flutter/modals/list.dart';

class homepgprovider extends ChangeNotifier {
  String searchQuery = '';
  // List<Productcards> pproduct = allProduct; //using this before DB
  List<Productcards> pproduct = [];

  // now we replace allProduct with pproduct everywhere (we did this when we were making admin pg, last major thing to add) why see bottom:

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
    for (var item in pproduct) {
      total += double.parse(item.price.replaceAll('\$', '')) * item.quantity;
    }
    return total;
  }

  List<Productcards> get cartItems {
    // return allProduct.where((item) => item.quantity > 0).toList();
    return pproduct.where((item) => item.quantity > 0).toList();
    // bascially using this logic we are taking all the elemets from allProduct (the super list having all other list), and we are filtering using .where() where we are selecting items from the list having quantity > 0 only that item is passed to the next page (i.e viewpg/checkoutpg)
    // ex: Apple      quantity = 2         after filter
    // Banana     quantity = 0              Apple
    //  Mango      quantity = 1             Mango
    // Orange     quantity = 0
  }

  int get cartCount {
    // return allProduct.where((item) => item.quantity > 0).length;
    return pproduct.where((item) => item.quantity > 0).length;
  }

  void updateSearch(String value) {
    searchQuery = value;
    notifyListeners();
  }

  List<Productcards> get filterProduct {
    if (searchQuery.isEmpty) {
      // return allProduct;
      return pproduct;
    }
    return pproduct.where((item) {
      return item.desc.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  void addProduct(Productcards item) {
    pproduct.add(item);
    notifyListeners();
  }

  void deleteProduct(Productcards item) {
    pproduct.remove(item);
    notifyListeners();
  }

  void updateProduct(int index, Productcards updateproduct) {
    pproduct[index] = updateproduct;
    notifyListeners();
  }

  // this func askes firestore for products, stores them inside pproduct, refreshes ui
  //this func must be called before admin,homepg why? if not then data will be called later from DB and admin and user will not see any data
  //best option call it in initstaein splashscreen.dart so that app opeans - loadproducts() gets called - data comes from DB , - we login (now we can see data is visible for both admin and user)
  Future<void> loadProducts() async {
    final products =
        await getProducts(); // now products have everything inside firebase
    pproduct = products.map((item) {
      // firestore gives data as a map, to dispaly it in ui we convert maps to productcards objects
      print(
        '////////////////////Data getting loaded////////////////////////////',
      );
      print(item);
      return Productcards(
        id: item['id'],
        desc: item['desc'],
        img: Image.asset(item['imagePath']),
        price: item['price'].toString(),
        weight: item['weight'].toString(),
        quantity: item['quantity'] ?? 0,
      );
    }).toList();
    print(pproduct.length);

    print(
      '////////////////////Data getting loaded////////////////////////////',
    );
    notifyListeners();
  }
}




// before we had admin pg this was the format of the app 
// allProduct
//    ↑
// Admin Page modifies it

// Provider reads it

// Home Page reads it

// Checkout Page reads it

// current architecture
// allProduct
//     ↑
//     │
// Provider reads it
//     │
//     ↓
// Home Page
// Checkout Page
// Details Page

// Admin Page
//     │
//     ↓
// Directly modifies allProduct   therefore allProduct.add(...)
//                                          allProduct.remove(...) can happen anywhere. The actual source of truth is: allProduct, Provider is just a helper sitting on top 


// what we should be doing 
// Provider
//    │
//    ├── products List which stores allProduct
//    │
//    ├── addProduct()
//    ├── deleteProduct()
//    ├── updateProduct()
//    │
//    ↓
// Home Page
// Checkout Page
// Details Page
// Admin Page
// now provider.product is source of truth nobody touches allProduct


// if we add            List<Productcards> products = allProduct;
// then the idea becomes 
// Provider owns products
//       ↑
// Everyone talks to Provider
