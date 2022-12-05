import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                'assets/cita-bg.jpg',
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
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
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
                          Navigator.pushNamed(context, '/Solicitud');
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
                          Navigator.pushNamed(context, '/Login');
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
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 700,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '"La justicia es Reina y Señora de Todas las virtudes"',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        '- Ciceron',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Como hacer tu solicitud?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 300,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black26,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Paso 1',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Icon(
                                  Icons.edit_note_rounded,
                                  size: 100,
                                ),
                                const Text(
                                  'Primero debes registrarte',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    backgroundColor: Colors.teal,
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/SignUp');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 300,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black26,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Paso 2',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Icon(
                                  Icons.account_circle_rounded,
                                  size: 100,
                                ),
                                const Text(
                                  'A continuacion inicia sesion',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    backgroundColor: Colors.teal,
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Login');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 300,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black26,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Paso 3',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Icon(
                                  Icons.note_add_rounded,
                                  size: 100,
                                ),
                                const Text(
                                  'Crear y enviar solicitud',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    backgroundColor: Colors.teal,
                                  ),
                                  child: const Text(
                                    'Solicitud',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Solicitud');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
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
