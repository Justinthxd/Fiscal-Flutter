import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  int option = 0;

  get getOption => option;

  set setOption(option) {
    this.option = option;
    notifyListeners();
  }

  List<TextEditingController> controllers = [
    for (int i = 0; i < 12; i++) TextEditingController()
  ];

  List<TextEditingController> get getControllers => controllers;

  setControllers(int i, TextEditingController controllers) {
    this.controllers[i] = controllers;
    notifyListeners();
  }

  String pruebas = '';

  String get getPruebas => pruebas;

  set setPruebas(String pruebas) {
    this.pruebas = pruebas;
    notifyListeners();
  }

  String testigos = '';

  String get getTestigos => testigos;

  set setTestigos(String testigos) {
    this.testigos = testigos;
    notifyListeners();
  }
}
