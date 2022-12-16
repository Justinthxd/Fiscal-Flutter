import 'package:fiscal/main.dart';
import 'package:fiscal/widgets/alerts.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final isLogged = box.get('isLogged');
    final isAdmin = box.get('isAdmin');
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
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
              if (box.get('isLogged')) {
                Navigator.pushNamed(context, '/Solicitud');
              } else {
                alertError(context, 'You need to be logged');
              }
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
          const SizedBox(width: 20),
          !isAdmin
              ? Container()
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Dashboard');
                  },
                  child: const Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
          const Spacer(),
          isLogged
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                    box.put('isLogged', false);
                    box.put('isAdmin', false);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : GestureDetector(
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
          isLogged
              ? Container()
              : GestureDetector(
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
    );
  }
}
