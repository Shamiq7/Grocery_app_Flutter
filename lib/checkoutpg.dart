import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';

class checkoutpg extends StatefulWidget {
  final List<Productcards> products;
  const checkoutpg({super.key, required this.products});

  @override
  State<checkoutpg> createState() => _checkoutpgState();
}

class _checkoutpgState extends State<checkoutpg> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in widget.products) {
      total += double.parse(item.price.replaceAll('\$', '')) * item.quantity;
    }
    return Scaffold(
      appBar: AppBar(title: Text('view page'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final item = widget.products[index];
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
                                        setState(() {
                                          if (item.quantity > 1) {
                                            item.quantity--;
                                          } else {
                                            item.quantity = 0;
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.remove_circle, size: 30),
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          item.quantity++;
                                        });
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
                '\$${total.toStringAsFixed(2)}',
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
