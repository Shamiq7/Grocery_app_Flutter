import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/Homepg.dart';
import 'package:grocery_app_flutter/LoginPg.dart';
import 'dart:ui';

class Loginpg extends StatefulWidget {
  const Loginpg({super.key});

  @override
  State<Loginpg> createState() => _LoginpgState();
}

class _LoginpgState extends State<Loginpg> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 17, 101, 19),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Green Grocer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.asset(
                              'images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  'images/mainn1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 400,
                            left: 10,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 9,
                                      sigmaY: 9,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      color: Colors.white.withOpacity(0.2),
                                      child: Text(
                                        'Savings, Delivered: from\n  the Store to Your Door',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 40),
                                SizedBox(
                                  width: 390,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      elevation: 5,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Homepage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Get Started',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                             child: Container(
//                               height: 300,
//                               width: 350,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),

//                               child: ClipRRect(
//                                 borderRadius: BorderRadiusGeometry.circular(15),
//                                 child: Image.asset(
//                                   'images/logo.png',
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             'Savings, Delivered: from',
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'the Store to Your Door',
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 90),
//                           SizedBox(
//                             width: 390,
//                             height: 50,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.green,
//                                 elevation: 5,
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Homepage(),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 'Get Started',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                         ],
//                       ),