import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';

class RutinaProvider with ChangeNotifier {
  RutinaModel? _rutina;

  RutinaModel? get usuario => _rutina;

  void setRutina(RutinaModel rutina) {
    _rutina = rutina;
    notifyListeners();
  }

  void clearUsuario() {
    _rutina = null;
    notifyListeners();
  }

  bool get tieneRutina => _rutina != null;
}
class RutinaDiaProvider with ChangeNotifier {
  List<DiaRutina>? _diaRutina;

  List<DiaRutina>? get rutina => _diaRutina;

  void setRutinaDia(List<DiaRutina> rutina) {
    _diaRutina = rutina;
    notifyListeners();
  }

  bool get tieneRutina => _diaRutina != null;
}