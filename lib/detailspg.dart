import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/Homepg.dart';
import 'package:grocery_app_flutter/checkoutpg.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';
import 'package:grocery_app_flutter/provider/homepgprovider.dart';
import 'package:provider/provider.dart';

class Detailspg extends StatelessWidget {
  final Productcards product;
  const Detailspg({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    context.watch<homepgprovider>();
    final provider = context.read<homepgprovider>();
    return Scaffold(
      body: SizedBox(
        height: 1500,
        child: Stack(
          children: [
            Positioned.fill(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Opacity(
                  opacity: 0.88,
                  child: Image.asset('images/pic4.png', fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              top: 30,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepg()),
                      );
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  SizedBox(width: 50),
                  Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 100,
              left: 30,
              child: Column(
                children: [
                  SizedBox(height: 300, width: 350, child: product.img),
                  SizedBox(height: 10),
                  Text(
                    '${product.desc} (${product.weight})',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${product.price}\$",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  product.quantity == 0
                      ? ElevatedButton(
                          onPressed: () {
                            provider.addtocart(product);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Item Added to Cart'),
                                action: SnackBarAction(
                                  label: 'View Cart',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => checkoutpg(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          child: Text('Add to Cart'),
                        )
                      : Center(
                          child: Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () {
                                  provider.removefromcart(product);
                                  ScaffoldMessenger.of(
                                    context,
                                  ).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Item Removed from Cart'),
                                    ),
                                  );
                                },
                                child: Icon(Icons.remove, color: Colors.black),
                              ),
                              SizedBox(width: 10),
                              Text(
                                product.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  provider.addtocart(product);

                                  ScaffoldMessenger.of(
                                    context,
                                  ).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Item Added to Cart'),
                                      action: SnackBarAction(
                                        label: 'View Cart',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  checkoutpg(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Icons.add, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
