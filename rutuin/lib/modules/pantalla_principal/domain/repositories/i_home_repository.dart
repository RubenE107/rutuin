import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/usuarioRutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/domain/entities/rutina.dart';

abstract class IHomeRepository {
  Future<List<RutinaModel>> getRutinas();
  Future<RutinasUsuarioModel?> getRutinaActual(String id);
  Future<RutinaModel?> getRutinaById(String id);
  // Future<Map<String, dynamic>?> getRutinaById(String id);
  // Future<bool> addRutina(Map<String, dynamic> rutina);
  // Future<bool> updateRutina(String id, Map<String, dynamic> rutina);
  // Future<bool> deleteRutina(String id);
  // Future<List<Map<String, dynamic>>> searchRutinas(String query);
}
