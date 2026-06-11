import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/Homepg.dart';
import 'package:grocery_app_flutter/LoginPg.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';
import 'package:grocery_app_flutter/modals/list.dart';

class Adminpg extends StatefulWidget {
  const Adminpg({super.key});

  @override
  State<Adminpg> createState() => _AdminpgState();
}

class _AdminpgState extends State<Adminpg> {
  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final imagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    Container(
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
                    Container(
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
                    Container(
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
                    Container(
                      width: 280,
                      height: 50,
                      child: TextField(
                        controller: imagecontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'images/name.png',
                          label: Text('Add Product Image URl'),
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
                    Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          //empty field validation
                          if (namecontroller.text.isEmpty ||
                              pricecontroller.text.isEmpty ||
                              weightcontroller.text.isEmpty ||
                              imagecontroller.text.isEmpty) {
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
                          if (allProduct.any(
                            (item) =>
                                item.desc.toLowerCase() ==
                                namecontroller.text.toLowerCase(),
                          )) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Product already exists')),
                            );
                            return;
                          }

                          allProduct.add(
                            Productcards(
                              desc: namecontroller.text,
                              img: Image.asset(imagecontroller.text),
                              price: pricecontroller.text,
                              weight: weightcontroller.text,
                            ),
                          );
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Item Added')));
                          namecontroller.clear();
                          pricecontroller.clear();
                          weightcontroller.clear();
                          imagecontroller.clear();
                          setState(() {});
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
                        itemCount: allProduct.length,

                        itemBuilder: (context, index) {
                          final item = allProduct[index];

                          return Card(
                            child: ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: item.img,
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text('${item.price} \n${item.weight}'),
                                ],
                              ),

                              // subtitle: Text('${item.price} | ${item.weight}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      allProduct.remove(item);
                                      setState(() {});
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
}
