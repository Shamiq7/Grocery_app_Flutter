import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/SplashScreen.dart';

class Homepg extends StatefulWidget {
  const Homepg({super.key});

  @override
  State<Homepg> createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1500,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,

                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset('images/pic6.png', fit: BoxFit.fill),
                  ),
                ),
              ),
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

              Positioned(
                top: 120,
                left: 5,
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
                    SizedBox(width: 85),
                    Text('View all', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Positioned(
                top: 166,
                left: 10,
                right: 10,
                child: SizedBox(
                  height: 250,

                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 240,
                                width: 240,
                                margin: EdgeInsets.only(right: 10),
                                child: Card(
                                  elevation: 10,

                                  child: Column(
                                    children: [
                                      SizedBox(height: 3),
                                      Container(
                                        height: 180,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(20),

                                          child: InkWell(
                                            onTap: () {
                                              // showModalBottomSheet(
                                              //   backgroundColor: Colors.green,
                                              //   shape: RoundedRectangleBorder(
                                              //     borderRadius:
                                              //         BorderRadiusGeometry.only(
                                              //           topLeft:
                                              //               Radius.circular(20),
                                              //           topRight:
                                              //               Radius.circular(20),
                                              //         ),
                                              //   ),
                                              //   elevation: 10,
                                              //   context: context,
                                              //   builder: (context) {
                                              //     return Column(
                                              //       mainAxisSize:
                                              //           MainAxisSize.min,
                                              //       children: [
                                              //         ListTile(
                                              //           leading: Text(
                                              //             '1.',
                                              //             style: TextStyle(
                                              //               color: Colors.white,
                                              //               fontSize: 25,
                                              //             ),
                                              //           ),
                                              //           title: Text(
                                              //             '\$20',
                                              //             style: TextStyle(
                                              //               color: Colors.white,
                                              //               fontWeight:
                                              //                   FontWeight.bold,
                                              //               fontSize: 30,
                                              //             ),
                                              //           ),
                                              //           subtitle: Text(
                                              //             'Organic Broccli 300g',
                                              //             style: TextStyle(
                                              //               color: Colors.white,
                                              //               fontSize: 20,
                                              //             ),
                                              //           ),
                                              //           trailing:
                                              //               ElevatedButton(
                                              //                 onPressed: () {},
                                              //                 child: Text(
                                              //                   'Add to Cart',
                                              //                 ),
                                              //               ),
                                              //         ),
                                              //         // ListTile(
                                              //         //   leading: Text('Ok'),
                                              //         //   title: Text('okk'),
                                              //         //   trailing: IconButton(
                                              //         //     onPressed: () {
                                              //         //       Navigator.pop(
                                              //         //         context,
                                              //         //       );
                                              //         //     },
                                              //         //     icon: Icon(
                                              //         //       Icons.close,
                                              //         //     ),
                                              //         //   ),
                                              //         // ),
                                              //         // ListTile(
                                              //         //   leading: Text('Ok'),
                                              //         //   title: Text('okk'),
                                              //         //   trailing: IconButton(
                                              //         //     onPressed: () {
                                              //         //       Navigator.pop(
                                              //         //         context,
                                              //         //       );
                                              //         //     },
                                              //         //     icon: Icon(
                                              //         //       Icons.close,
                                              //         //     ),
                                              //         //   ),
                                              //         // ),
                                              //         // ListTile(
                                              //         //   leading: Text('Ok'),
                                              //         //   title: Text('okk'),
                                              //         //   trailing: IconButton(
                                              //         //     onPressed: () {
                                              //         //       Navigator.pop(
                                              //         //         context,
                                              //         //       );
                                              //         //     },
                                              //         //     icon: Icon(
                                              //         //       Icons.close,
                                              //         //     ),
                                              //         //   ),
                                              //         // ),
                                              //       ],
                                              //     );
                                              //   },
                                              // );
                                            },
                                            child: Image.asset(
                                              'images/picc2.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              10,
                                              0,
                                              20,
                                              0,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '\$20',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '\$20',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Organic Broccli\n 300g',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              // Positioned(
              //   top: 430,
              //   left: 10,
              //   right: 10,
              //   child: Text(
              //     'Just for you',
              //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // Positioned(
              //   top: 475,
              //   left: 10,
              //   right: 10,
              //   child: SizedBox(
              //     height: 250,

              //     child: ListView.builder(
              //       itemCount: 5,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Column(
              //           children: [
              //             Row(
              //               children: [
              //                 Container(
              //                   height: 240,
              //                   width: 240,
              //                   margin: EdgeInsets.only(right: 10),
              //                   child: Card(
              //                     elevation: 10,

              //                     child: Column(
              //                       children: [
              //                         SizedBox(height: 3),
              //                         Container(
              //                           height: 180,
              //                           width: 180,
              //                           decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.circular(
              //                               20,
              //                             ),
              //                           ),
              //                           child: ClipRRect(
              //                             borderRadius:
              //                                 BorderRadiusGeometry.circular(20),

              //                             child: Image.asset(
              //                               'images/picc2.png',
              //                               fit: BoxFit.fill,
              //                             ),
              //                           ),
              //                         ),
              //                         Row(
              //                           children: [
              //                             Padding(
              //                               padding: const EdgeInsets.fromLTRB(
              //                                 10,
              //                                 0,
              //                                 20,
              //                                 0,
              //                               ),
              //                               child: Text(
              //                                 '\$20',
              //                                 style: TextStyle(
              //                                   fontSize: 25,
              //                                   fontWeight: FontWeight.bold,
              //                                 ),
              //                               ),
              //                             ),
              //                             Text(
              //                               'Organic Broccli\n 300g',
              //                               style: TextStyle(
              //                                 fontSize: 15,
              //                                 fontWeight: FontWeight.bold,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: 740,
              //   left: 10,
              //   right: 10,
              //   child: Text(
              //     'Just for you',
              //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // Positioned(
              //   top: 788,
              //   left: 10,
              //   right: 10,
              //   child: SizedBox(
              //     height: 250,

              //     child: ListView.builder(
              //       itemCount: 5,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Column(
              //           children: [
              //             Row(
              //               children: [
              //                 Container(
              //                   height: 240,
              //                   width: 240,
              //                   margin: EdgeInsets.only(right: 10),
              //                   child: Card(
              //                     elevation: 10,

              //                     child: Column(
              //                       children: [
              //                         SizedBox(height: 3),
              //                         Container(
              //                           height: 180,
              //                           width: 180,
              //                           decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.circular(
              //                               20,
              //                             ),
              //                           ),
              //                           child: ClipRRect(
              //                             borderRadius:
              //                                 BorderRadiusGeometry.circular(20),

              //                             child: Image.asset(
              //                               'images/picc2.png',
              //                               fit: BoxFit.fill,
              //                             ),
              //                           ),
              //                         ),
              //                         Row(
              //                           children: [
              //                             Padding(
              //                               padding: const EdgeInsets.fromLTRB(
              //                                 10,
              //                                 0,
              //                                 20,
              //                                 0,
              //                               ),
              //                               child: Text(
              //                                 '\$20',
              //                                 style: TextStyle(
              //                                   fontSize: 25,
              //                                   fontWeight: FontWeight.bold,
              //                                 ),
              //                               ),
              //                             ),
              //                             Text(
              //                               'Organic Broccli\n 300g',
              //                               style: TextStyle(
              //                                 fontSize: 15,
              //                                 fontWeight: FontWeight.bold,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
