import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/Homepg.dart';
import 'package:grocery_app_flutter/LoginPg.dart';
import 'package:grocery_app_flutter/functions/firestorefunc.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';

import 'package:grocery_app_flutter/provider/homepgprovider.dart';
import 'package:provider/provider.dart';

class Adminpg extends StatelessWidget {
  Adminpg({super.key});

  final namecontroller = TextEditingController();

  final pricecontroller = TextEditingController();

  final weightcontroller = TextEditingController();

  final imagecontroller = TextEditingController();
  final catagorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.watch<homepgprovider>();
    final provider = context.read<homepgprovider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Stack(
            children: [
              Positioned.fill(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset('images/main4.png', fit: BoxFit.fill),
                ),
              ),
              Positioned(
                top: 55,
                left: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginpg(),
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Admin Panel',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Homepg()),
                            );
                          },
                          icon: Icon(Icons.home_filled, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 140,
                left: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Add Item',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 280,
                      height: 50,
                      child: TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Product Name',
                          label: Text('Add Product name'),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 280,
                      height: 50,

                      child: TextField(
                        controller: pricecontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Price',
                          label: Text('Add Product Price'),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 280,
                      height: 50,
                      child: TextField(
                        controller: weightcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Weight in g',
                          label: Text('Add Product Weight'),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 280,
                      height: 50,
                      child: TextField(
                        controller: imagecontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'images/name.png',
                          label: Text('Add Product Image URL'),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 280,
                      height: 50,
                      child: TextField(
                        controller: catagorycontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'write catagory',
                          label: Text('Add Product catagory'),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          //empty field validation
                          if (namecontroller.text.isEmpty ||
                              pricecontroller.text.isEmpty ||
                              weightcontroller.text.isEmpty ||
                              imagecontroller.text.isEmpty ||
                              catagorycontroller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('PLease Fill All the Fields'),
                              ),
                            );
                            return;
                          }
                          //image path validation
                          if (!imagecontroller.text.startsWith('images/') ||
                              !(imagecontroller.text.endsWith('png') ||
                                  imagecontroller.text.endsWith('jpg') ||
                                  imagecontroller.text.endsWith('jpeg'))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'image path must be in the format images/mango.png',
                                ),
                              ),
                            );
                            return;
                          }

                          //price validation
                          if (double.tryParse(pricecontroller.text) == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Price must be a valid number'),
                              ),
                            );
                            return;
                          }
                          //duplicate check
                          if (provider.pproduct.any(
                            (item) =>
                                item.desc.toLowerCase() ==
                                namecontroller.text.toLowerCase(),
                          )) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Product already exists')),
                            );
                            return;
                          }
                          final docRef = await addtoDB(
                            namecontroller.text,
                            pricecontroller.text,
                            weightcontroller.text,
                            imagecontroller.text,
                            catagorycontroller.text,
                          );
                          // await provider.refreshProducts();
                          provider.addProduct(
                            Productcards(
                              id: docRef.id,
                              desc: namecontroller.text,
                              img: Image.asset(imagecontroller.text),
                              price: pricecontroller.text,
                              weight: weightcontroller.text,
                            ),
                          );
                          // allProduct.add(      what we were doing before provider
                          //   Productcards(
                          //     desc: namecontroller.text,
                          //     img: Image.asset(imagecontroller.text),
                          //     price: pricecontroller.text,
                          //     weight: weightcontroller.text,
                          //   ),
                          // );
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Item Added')));
                          namecontroller.clear();
                          pricecontroller.clear();
                          weightcontroller.clear();
                          imagecontroller.clear();
                          catagorycontroller.clear();

                          // setState(() {});
                        },
                        child: Text('Add'),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Current Items :',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 300,
                      width: 320,

                      child: ListView.builder(
                        itemCount: provider.pproduct.length,

                        itemBuilder: (context, index) {
                          final item = provider.pproduct[index];

                          return Card(
                            child: ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    child: item.img,
                                  ),
                                  SizedBox(width: 10),
                                  Text('${item.price} \n${item.weight}'),
                                ],
                              ),

                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      await _updateItem(context, item, index);
                                      // setState(() {});
                                    },
                                    icon: Icon(Icons.edit),
                                  ),

                                  IconButton(
                                    onPressed: () async {
                                      // allProduct.remove(item);
                                      // setState(() {});
                                      final id = item.id!;

                                      await deletfromDB(id);
                                      if (!context.mounted) return;
                                      provider.deleteProduct(id);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text('${item.desc} deleted'),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateItem(BuildContext context, Productcards item, int index) {
    final namecontroller = TextEditingController(text: item.desc);
    final pricecontroller = TextEditingController(text: item.price);
    final weightcontroller = TextEditingController(text: item.weight);
    final imgcontroller = TextEditingController();
    final catagorycontrol = TextEditingController(text: item.catagory);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(label: Text('name')),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: pricecontroller,
                  decoration: InputDecoration(label: Text('price')),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: weightcontroller,
                  decoration: InputDecoration(label: Text('weight')),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: imgcontroller,
                  decoration: InputDecoration(
                    label: Text('image'),
                    hintText: 'images/mango.png',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: catagorycontrol,
                  decoration: InputDecoration(label: Text('Catagory')),
                ),
              ],
            ),
          ),
          //
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final provider = context.read<homepgprovider>();
                if (namecontroller.text.isEmpty ||
                    pricecontroller.text.isEmpty ||
                    weightcontroller.text.isEmpty ||
                    imgcontroller.text.isEmpty) {
                  return;
                }
                await updateDB(
                  item.id!,
                  namecontroller.text,
                  pricecontroller.text,
                  weightcontroller.text,
                  imgcontroller.text,
                  catagorycontrol.text,
                );

                await provider.refreshProducts();
                // provider.updateProduct(
                //   index,
                //   Productcards(
                //     desc: namecontroller.text,
                //     img: Image.asset(imgcontroller.text),
                //     price: pricecontroller.text,
                //     weight: weightcontroller.text,
                //   ),
                // );
                // allProduct[index] = Productcards(
                //   desc: namecontroller.text,
                //   img: Image.asset(imgcontroller.text),
                //   price: pricecontroller.text,
                //   weight: weightcontroller.text,
                //   quantity: item.quantity,
                // );
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
