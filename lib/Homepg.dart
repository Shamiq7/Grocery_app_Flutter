import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/checkoutpg.dart';
import 'package:grocery_app_flutter/provider/homepgprovider.dart';

import 'package:grocery_app_flutter/subwidgets/homepg1.dart';
import 'package:grocery_app_flutter/subwidgets/homepg2.dart';
import 'package:grocery_app_flutter/subwidgets/homepg3.dart';
import 'package:provider/provider.dart';

class Homepg extends StatelessWidget {
  const Homepg({super.key});

  
  @override
  Widget build(BuildContext context) {
    final provider2 = context.read<homepgprovider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1500,
          child: Stack(
            children: [
              //#1
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
              //#2
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
                        SizedBox(width: 50),
                        Icon(Icons.notification_add, color: Colors.white),
                        SizedBox(width: 20),
                        Icon(Icons.favorite_outline, color: Colors.white),
                        SizedBox(width: 20),
                        Icon(Icons.search, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              //#3
              Positioned(
                top: 120,

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
                    SizedBox(width: 70),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                checkoutpg(products: provider2.cartItems),
                          ),
                        );
                      },
                      child: Text(
                        'View Cart',
                        style: TextStyle(
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
              Positioned(
                top: 166,
                left: 10,
                right: 8,
                child: SizedBox(height: 310, child: homepg1()),
              ),

              Positioned(
                top: 490,
                left: 10,
                right: 10,
                child: Text(
                  'Just for you',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 540,
                left: 10,
                right: 10,
                child: SizedBox(height: 310, child: Homepg2()),
              ),
              Positioned(
                top: 855,
                left: 10,
                right: 10,
                child: Text(
                  'Suggested',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 910,
                left: 10,
                right: 10,
                child: SizedBox(height: 310, child: Homepg3()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
