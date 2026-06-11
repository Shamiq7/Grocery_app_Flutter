import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/LoginPg.dart';
import 'package:grocery_app_flutter/modals/list.dart';

class Adminpg extends StatefulWidget {
  const Adminpg({super.key});

  @override
  State<Adminpg> createState() => _AdminpgState();
}

class _AdminpgState extends State<Adminpg> {
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
                        SizedBox(width: 15),
                        Text(
                          'Admin Panel',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Weight',
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
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Image URL',
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
                        onPressed: () {},
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
                                    onPressed: () {},
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
