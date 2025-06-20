import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/usuarioRutina_models.dart';

import '../repositories/i_home_repository.dart';

class ObtenerRutinaUseCase {
  final IHomeRepository repository;

  ObtenerRutinaUseCase(this.repository);


  Future<List<RutinaModel>> obtenerRutinas() {
    return repository.getRutinas();
  }
  Future<RutinasUsuarioModel?> obtenerRutinaActual(String id) {
    return repository.getRutinaActual(id);
  }
  Future<RutinaModel?> obtenerRutinaById(String id) {
    return repository.getRutinaById(id);
  }
  Future<RutinasUsuarioModel?> selecionarNuevaRutina(String idUsuario, List<RutinaInfo> listaRutinas) {
    return repository.selecionarNuevaRutina(idUsuario,listaRutinas);
  }

  // Future<void> guardarRutina(RutinaModel rutina) {
  //   return repository.guardarRutina(rutina);
  // }

  // Future<void> eliminarRutina(String id) {
  //   return repository.eliminarRutina(id);
  // }
}
