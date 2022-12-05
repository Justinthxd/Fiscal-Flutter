import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<TextEditingController> controllers = [
    for (int i = 0; i < 4; i++) TextEditingController()
  ];

  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Container(
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
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/Solicitud');
                        },
                        child: const Text(
                          'Solicitud',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/Login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 900,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Container(
                    height: 550,
                    width: 500,
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
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 40,
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
                              labelText: 'Name',
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
                            controller: controllers[2],
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
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          child: TextField(
                            controller: controllers[3],
                            obscureText: true,
                            style: const TextStyle(
                              fontSize: 18.5,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.2),
                              labelText: 'Confirm Password',
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
                            fireStore.collection('users').add({
                              'name': controllers[0].text,
                              'email': controllers[1].text,
                              'password': controllers[2].text,
                            });
                            controllers[0].text = '';
                            controllers[1].text = '';
                            controllers[2].text = '';
                            setState(() {});
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
