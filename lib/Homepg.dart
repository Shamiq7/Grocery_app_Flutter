import 'package:flutter/material.dart';

class Homepg extends StatefulWidget {
  const Homepg({super.key});

  @override
  State<Homepg> createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: double.infinity,
              height: double.infinity,

              child: Opacity(
                opacity: 0.7,
                child: Image.asset('images/pic5.png', fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            top: 47,
            left: 5,
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(width: 120),
                Text('View all', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Positioned(
            top: 180,
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
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.only(right: 10),
                            child: Card(elevation: 10, color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Desc about\nthe veggie',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 420,
            left: 10,
            right: 10,
            child: Text(
              'Just for you',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 460,
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
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.only(right: 10),
                            child: Card(elevation: 10, color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Desc about\nthe veggie',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
