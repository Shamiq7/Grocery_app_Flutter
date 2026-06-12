import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/SplashScreen.dart';
import 'package:grocery_app_flutter/provider/homepgprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => homepgprovider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: spalshscreen());
  }
}



// Initial archetecture            
// Productcards Model                   
//         ↓
//    list.dart
//         ↓
//    Provider
//         ↓
//         UI

// what we want to do
//      Admin
//       ↓
//  Firebase Storage
//       ↓
//    Firestore
//       ↓
//    Provider
//       ↓
//      UI     goal-         Admin uploads products.

// Users automatically see them.

// No code changes.




// Better Architecture (if building from scratch)
//
// Current approach:
// Productcard  -> Homepg1
// product2     -> Homepg2
// product3     -> Homepg3
//
// Problem:
// Data is split across multiple lists.
// Search, Admin CRUD, Provider and Firestore have to deal with
// multiple sources of data.
//
// Better approach:
//
// One Master Product List
//
// products = [
//   {
//     name: "Apple",
//     category: "fruits"
//   },
//   {
//     name: "Bread",
//     category: "groceries"
//   },
//   {
//     name: "Dettol",
//     category: "household"
//   }
// ];
//
// Structure:
//
// Firestore
//     ↓
// products collection
//     ↓
// Provider.products
//     ↓
// Homepg1 -> products.where(category == "groceries")
// Homepg2 -> products.where(category == "fruits")
// Homepg3 -> products.where(category == "household")
//
// Benefits:
// ✓ Single source of truth
// ✓ Easier CRUD operations
// ✓ Easier search functionality
// ✓ Cleaner Provider architecture
// ✓ Directly compatible with Firestore
// ✓ Admin only needs to specify category
// ✓ Changes automatically reflect everywhere
//
// Example:
//
// Admin adds:
// {
//   name: "Mango",
//   category: "fruits"
// }
//
// Result:
// Homepg2 automatically shows Mango
// No need to manually add it to a specific list.
//
// Final Architecture:
//
// Firestore Products Collection
//           ↓
//      Provider.products
//           ↓
//     Filter by Category
//           ↓
// Homepg1  Homepg2  Homepg3