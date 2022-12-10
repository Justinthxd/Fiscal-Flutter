import 'package:firebase_core/firebase_core.dart';
import 'package:fiscal/pages/Dashboard.dart';
import 'package:fiscal/pages/Login.dart';
import 'package:fiscal/pages/SignUp.dart';
import 'package:fiscal/pages/Solicitud.dart';
import 'package:fiscal/pages/Solicitud2.dart';
import 'package:fiscal/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'pages/Home.dart';

Future main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fiscal',
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/Login': (context) => Login(),
          '/SignUp': (context) => SignUp(),
          '/Solicitud': (context) => Solicitud(),
          '/Solicitud2': (context) => Solicitud2(),
          '/Dashboard': (context) => const Dashboard(),
        },
      ),
    );
  }
}
