import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/provider/homepgprovider.dart';
import 'package:provider/provider.dart';

class checkoutpg extends StatelessWidget {
  // final List<Productcards> products; we were using these when homepg1,2,3 were sending their selected items manually, now it is present inside provider so now we can use provider(watch() and func cartItems which contains all the ele we have selected from homepg1,2,3) insted of list here 
  const checkoutpg({super.key});

  @override
  Widget build(BuildContext context) {
    final provider2 = context.watch<homepgprovider>();
    final provider = context.read<homepgprovider>();
    //   context.watch<homepgprovider>();
    // final provider = context.read<homepgprovider>();
    // can do this do how it works - provider calls the func - func have notifylistner() it also gets called - whenever notifylistner() gets called then watch() rebuild the entire ui
      //          Provider
      //        /    |    \
      //       /     |     \
      // Homepg1  Homepg2  Homepg3            
      //       \     |     /
      //        \    |    /
      //        Checkoutpg
      // everybody talking to same provider        read  -> I want to DO something
      //                                           watch -> I want to SHOW something
    return Scaffold(
      appBar: AppBar(title: Text('view page'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider2.cartItems.length,
                itemBuilder: (context, index) {
                  final item = provider2.cartItems[index];
                  return Container(
                    child: Center(
                      child: item.quantity == 0
                          ? SizedBox.shrink()
                          : Card(
                              elevation: 10,
                              child: ListTile(
                                leading: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: item.img.image,

                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('${item.desc} ${item.weight}'),
                                subtitle: Text(
                                  item.price,
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        provider.removefromcart(item);
                                      },
                                      icon: Icon(Icons.remove_circle, size: 30),
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        provider.addtocart(item);
                                      },
                                      icon: Icon(
                                        Icons.add_box_rounded,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(width: 10),
              Text('Total:', style: TextStyle(fontSize: 30)),
              SizedBox(width: 10),
              Text(
                '\$${provider2.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 5),
                onPressed: () {},
                child: Text('Checkout'),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
