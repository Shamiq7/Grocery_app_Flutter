import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/checkoutpg.dart';
import 'package:grocery_app_flutter/detailspg.dart';
import 'package:grocery_app_flutter/provider/homepgprovider.dart';
import 'package:grocery_app_flutter/subwidgets/filterpg.dart';
import 'package:grocery_app_flutter/subwidgets/homepg1.dart';
import 'package:grocery_app_flutter/subwidgets/homepg2.dart';
import 'package:grocery_app_flutter/subwidgets/homepg3.dart';
import 'package:provider/provider.dart';

// Productcards Model
//         ↓
//       list.dart
//         ↓
//  Homepg1 / Homepg2 / Homepg3
//         ↓
//   homepgprovider
//         ↓
//     checkoutpg

class Homepg extends StatelessWidget {
  const Homepg({super.key});

  @override
  Widget build(BuildContext context) {
    final provider2 = context.read<homepgprovider>();
    final provider = context.watch<homepgprovider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1500,
          child: Stack(
            children: [
              //
              //#1
              //
              Positioned.fill(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,

                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset('images/pic6.png', fit: BoxFit.fill),
                  ),
                ),
              ),
              //
              //#2
              //
              Positioned(
                top: 0,

                child: Container(
                  height: 110,
                  width: 415,
                  color: const Color.fromARGB(255, 17, 101, 19),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            text: 'Veggie Mart XL\n',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'in 25 minutes',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 100),
                        CircleAvatar(
                          backgroundColor: const Color.fromARGB(
                            255,
                            17,
                            101,
                            19,
                          ),
                          radius: 30,
                          backgroundImage: AssetImage('images/pic7.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 125,
                left: 30,
                child: SizedBox(
                  height: 54,
                  width: 350,

                  //
                  // User types
                  //       ↓
                  // onChanged()
                  //       ↓
                  // updateSearch()
                  //       ↓
                  // searchQuery updated
                  //       ↓
                  // notifyListeners()
                  //       ↓
                  // Widgets using watch() rebuild
                  //       ↓
                  // filterProduct runs again
                  //       ↓
                  // New filtered list appears
                  //
                  child: TextField(
                    onChanged: (value) {
                      provider2.updateSearch(value);
                    },

                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green.shade600,
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Search Item',

                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
              //
              // //#3
              //
              Positioned(
                top: 190,

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Recommended for you',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    SizedBox(width: 34),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                // checkoutpg(products: provider2.cartItems),
                                checkoutpg(),
                          ),
                        );
                      },
                      child: Text(
                        'View Cart (${provider.cartCount})',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 17, 101, 19),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              //
              //#4
              //
              //
              if (provider.searchQuery.isEmpty)
                Positioned(
                  top: 250,
                  left: 10,
                  right: 8,
                  child: SizedBox(height: 310, child: homepg1()),
                ),
              //
              //#5
              //
              if (provider.searchQuery.isEmpty)
                Positioned(
                  top: 570,
                  left: 10,
                  right: 10,
                  child: Text(
                    'Just for you',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              //
              //#6
              //
              if (provider.searchQuery.isEmpty)
                Positioned(
                  top: 620,
                  left: 10,
                  right: 10,
                  child: SizedBox(height: 310, child: Homepg2()),
                ),
              //
              //#7
              //
              if (provider.searchQuery.isEmpty)
                Positioned(
                  top: 945,
                  left: 10,
                  right: 10,
                  child: Text(
                    'Suggested',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              //
              //#8
              //
              if (provider.searchQuery.isEmpty)
                Positioned(
                  top: 995,
                  left: 10,
                  right: 10,
                  child: SizedBox(height: 310, child: Homepg3()),
                ),

              //
              //
              //                 //9//
              //
              //
              if (provider.searchQuery.isNotEmpty)
                Positioned(
                  top: 250,
                  left: 10,
                  right: 10,
                  child: SizedBox(height: 1000, child: Filterpg()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
