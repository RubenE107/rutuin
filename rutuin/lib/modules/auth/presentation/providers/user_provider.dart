import 'package:flutter/material.dart';
import '../../data/models/usuario_models.dart'; // Ajusta según tu estructura

class UserProvider with ChangeNotifier {
  UsuarioModel? _usuario;

  UsuarioModel? get usuario => _usuario;

  void setUsuario(UsuarioModel user) {
    _usuario = user;
    notifyListeners();
  }

  void clearUsuario() {
    _usuario = null;
    notifyListeners();
  }

  bool get estaLogueado => _usuario != null;
}
