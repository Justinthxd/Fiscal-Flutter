import 'package:fiscal/pages/Dashboard.dart';
import 'package:fiscal/pages/Login.dart';
import 'package:fiscal/pages/SignUp.dart';
import 'package:fiscal/pages/Solicitud.dart';
import 'package:fiscal/pages/Solicitud2.dart';
import 'package:flutter/material.dart';

import 'pages/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/Login': (context) => Login(),
        '/SignUp': (context) => SignUp(),
        '/Solicitud': (context) => Solicitud(),
        '/Solicitud2': (context) => Solicitud2(),
        '/Dashboard': (context) => const Dashboard(),
      },
    );
  }
}
