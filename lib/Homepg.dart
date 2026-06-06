import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';
import 'package:grocery_app_flutter/modals/list.dart';

class Homepg extends StatefulWidget {
  const Homepg({super.key});

  @override
  State<Homepg> createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  // int quantity = 0;
  List<int> quantity = List.filled(Productcard.length, 0);
  @override
  Widget build(BuildContext context) {
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

              //
              //
              //#4
              //
              //
              Positioned(
                top: 166,
                left: 10,
                right: 8,
                child: SizedBox(
                  height: 310,
                  child: ListView.builder(
                    itemCount: Productcard.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = Productcard[index];
                      return Container(
                        height: 310,
                        width: 240,

                        margin: EdgeInsets.only(right: 15),
                        child: Card(
                          elevation: 10,

                          child: Column(
                            children: [
                              SizedBox(
                                height: 180,
                                width: 180,

                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),

                                  child: item.img,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      10,
                                      0,
                                      10,
                                      0,
                                    ),
                                    child: Text(
                                      item.price,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    '${item.desc}\n ${item.weight}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: 200,
                                child: item.quantity == 0
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            item.quantity = 1;
                                          });
                                          ScaffoldMessenger.of(
                                            context,
                                          ).hideCurrentSnackBar();
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '${item.desc} added to cart',
                                              ),
                                              action: SnackBarAction(
                                                label: 'View Cart',
                                                onPressed: () {},
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      20,
                                                    ),
                                              ),
                                              duration: Duration(seconds: 5),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Add',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    : Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (item.quantity > 1) {
                                                    item.quantity--;
                                                  } else {
                                                    item.quantity = 0;
                                                  }
                                                });
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).hideCurrentSnackBar();
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      '${item.desc} removed from cart',
                                                    ),
                                                    duration: Duration(
                                                      seconds: 2,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadiusGeometry.circular(
                                                            20,
                                                          ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              item.quantity.toString(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(width: 5),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  item.quantity++;
                                                });
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).hideCurrentSnackBar();
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      '${item.desc} added to cart',
                                                    ),
                                                    action: SnackBarAction(
                                                      label: 'View Cart',
                                                      onPressed: () {},
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadiusGeometry.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    duration: Duration(
                                                      seconds: 5,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
