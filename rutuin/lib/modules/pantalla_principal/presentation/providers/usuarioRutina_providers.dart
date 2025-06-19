import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/usuarioRutina_models.dart';

class UserRutinProvider with ChangeNotifier {
  RutinasUsuarioModel? _userRutin;

  RutinasUsuarioModel? get usuario => _userRutin;

  void setUsuarioRutina(RutinasUsuarioModel user) {
    _userRutin = user;
    notifyListeners();
  }

  void clearUsuario() {
    _userRutin = null;
    notifyListeners();
  }

  bool get tieneRutina => _userRutin != null;
}
