import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/pages/Homepg.dart';
import 'package:grocery_app_flutter/pages/adminpg.dart';
import 'package:grocery_app_flutter/services/functions/authfunction.dart';

class Loginpg extends StatefulWidget {
  const Loginpg({super.key});

  @override
  State<Loginpg> createState() => _LoginpgState();
}

class _LoginpgState extends State<Loginpg> {
  bool isLogin = false;
  final _formKEY = GlobalKey<FormState>();

  String mail = '';
  String name = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                  child: Image.asset('images/pic4.png', fit: BoxFit.fill),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                  ),
                ),

                Form(
                  key: _formKEY,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 350,
                          child: !isLogin
                              ? TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: Text('Write your Name'),

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(width: 1.5),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Valid Name';
                                    }
                                    if (value.length < 2) {
                                      return 'PLease Enter Name with Length > 2';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    name = newValue!;
                                  },
                                )
                              : Container(),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text('Write your Mail'),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(width: 1.5),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !(value.toString().contains('@'))) {
                                return 'Please Enter Valid mail with @';
                              }
                              if (value.length < 2) {
                                return 'PLease Enter Name with Length > 2';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              mail = newValue!;
                            },
                          ),
                        ),
                        SizedBox(height: 15),

                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text('Write your Password'),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(width: 1.5),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              if (value.length < 5) {
                                return 'PLease Enter Password with Length > 2';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              password = newValue!;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKEY.currentState!.validate()) {
                                _formKEY.currentState!.save();
                                if (isLogin) {
                                  await login(mail, password);
                                } else {
                                  await signup(mail, password);
                                }
                                //
                                //
                                if (mail == 'admin@gmail.com') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Adminpg(),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Homepg(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: !isLogin
                                ? Text(
                                    'Sign up',
                                    style: TextStyle(color: Colors.green),
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(color: Colors.green),
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: !isLogin
                                ? Text(
                                    'Already have an account? Login',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    'Don\'t have an account? Sign up',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
