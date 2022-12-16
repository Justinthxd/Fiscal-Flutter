import 'dart:async';

import 'package:flutter/material.dart';

alertAccountValidated(BuildContext context, [String? text]) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      Timer(const Duration(milliseconds: 1700), () {
        if (text != null) {
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/Login');
        }
      });
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Icon(
                  Icons.done_rounded,
                  size: 100,
                  color: Colors.lightGreenAccent,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                text ?? 'Account Created Successfully',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

alertError(BuildContext context, String text, [bool? login]) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Mensaje del sistema',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (login ?? false) {
                    Navigator.pushReplacementNamed(context, '/Login');
                  }
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
