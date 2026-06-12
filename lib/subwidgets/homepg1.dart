import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/checkoutpg.dart';
import 'package:grocery_app_flutter/detailspg.dart';
import 'package:grocery_app_flutter/provider/homepgprovider.dart';
import 'package:provider/provider.dart';

class homepg1 extends StatelessWidget {
  const homepg1({super.key});

  @override
  Widget build(BuildContext context) {
    //  final provider2 = context.watch<homepgprovider>(); //listens for changes
    context
        .watch<
          homepgprovider
        >(); // why use this here? because when provider.addtocart etc is called then notifylistner gets called and we need that ui gets rebuild in homepg1, but if we have no watch( ) then we cannot rebuild that is why we use it here
    //why not use provider2 here because we have no specific ui that needs rebuilding like something inside text(__), listview
    final provider = context.read<homepgprovider>(); //calls functions

    return ListView.builder(
      // itemCount: Productcard.length,
      itemCount: provider.pproduct.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = provider.pproduct[index];
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

                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailspg(product: item),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),

                      child: item.img,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                            provider.addtocart(item);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item.desc} added to cart'),
                                action: SnackBarAction(
                                  label: 'View Cart',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => checkoutpg(
                                          // products: provider.cartItems
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
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
                                  provider.removefromcart(item);
                                  ScaffoldMessenger.of(
                                    context,
                                  ).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${item.desc} removed from cart',
                                      ),
                                      duration: Duration(seconds: 2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(20),
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Icons.remove, color: Colors.white),
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
                                  provider.addtocart(item);
                                  ScaffoldMessenger.of(
                                    context,
                                  ).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${item.desc} added to cart',
                                      ),
                                      action: SnackBarAction(
                                        label: 'View Cart',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => checkoutpg(
                                                // products: provider2.cartItems
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(20),
                                      ),
                                      duration: Duration(seconds: 5),
                                    ),
                                  );
                                },
                                child: Icon(Icons.add, color: Colors.white),
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
    );
  }
}
