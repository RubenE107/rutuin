import 'package:flutter/material.dart';

class ejercicioProvider with ChangeNotifier {
  List<String> _ejercicios = [];

  List<String> get ejercicios => _ejercicios;

  void setEjercicios(List<String> ejercicios) {
    _ejercicios = ejercicios;
    notifyListeners();
  }

  void clearEjercicios() {
    _ejercicios = [];
    notifyListeners();
  }

  bool get tieneEjercicios => _ejercicios.isNotEmpty;
}