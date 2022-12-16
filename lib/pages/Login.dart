import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiscal/main.dart';
import 'package:fiscal/provider/provider.dart';
import 'package:fiscal/widgets/AppBar.dart';
import 'package:fiscal/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<TextEditingController> controllers = [
    for (int i = 0; i < 4; i++) TextEditingController()
  ];

  Future getData() async {
    final res = await fireStore.collection("users").get();

    return res.docs;
  }

  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                'assets/login-bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                MyAppBar(),
                Container(
                  height: 900,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Container(
                    height: 500,
                    width: 450,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 100, 100, 100)
                          .withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black12,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          child: TextField(
                            controller: controllers[0],
                            style: const TextStyle(
                              fontSize: 18.5,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.2),
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          child: TextField(
                            controller: controllers[1],
                            obscureText: true,
                            style: const TextStyle(
                              fontSize: 18.5,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.2),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.withOpacity(0.5),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            int aux = 0;
                            if (controllers[0].text != '' &&
                                controllers[1].text != '') {
                              // - - - - //
                              getData().then((value) {
                                // - - - - //
                                value.forEach((value) {
                                  if (value.data()['email'].toString().trim() ==
                                          controllers[0].text.trim() &&
                                      value
                                              .data()['password']
                                              .toString()
                                              .trim() ==
                                          controllers[1].text.trim()) {
                                    aux = 1;
                                    if (value
                                                .data()['email']
                                                .toString()
                                                .trim() ==
                                            'root' &&
                                        value
                                                .data()['password']
                                                .toString()
                                                .trim() ==
                                            'root') {
                                      Navigator.pushNamed(
                                          context, '/Dashboard');
                                      box.put('isAdmin', true);
                                    } else {
                                      Navigator.pushNamed(context, '/');
                                    }
                                    main.setName = controllers[0].text;
                                    box.put('isLogged', true);
                                    controllers[0].text = '';
                                    controllers[1].text = '';
                                  }
                                });
                                if (aux == 0) {
                                  alertError(context, 'User not found');
                                }
                              });
                            }
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.withOpacity(0.7),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/SignUp');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    children: const [
                      Spacer(),
                      Icon(
                        Icons.copyright_rounded,
                        color: Colors.white24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Procuraduria Fiscal R.D.',
                        style: TextStyle(
                          color: Colors.white24,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.facebook_rounded,
                        size: 25,
                        color: Colors.white24,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.apple_rounded,
                        size: 30,
                        color: Colors.white24,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.android_rounded,
                        size: 30,
                        color: Colors.white24,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
