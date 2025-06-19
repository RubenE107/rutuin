import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rutuin/modules/auth/presentation/providers/user_provider.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/usuarioRutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/data/repositories/home_repository_impl.dart';
//import 'package:rutuin/modules/pantalla_principal/domain/repositories/i_home_repository.dart';
import 'package:rutuin/modules/pantalla_principal/domain/usecases/obtener_rutina_usecase.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/usuarioRutina_providers.dart';

class EntrenamientoScreenController {
  late final ObtenerRutinaUseCase _obtenerRutinaUseCase;
  late final ObtenerRutinaUseCase _obtenerRutinaActualUseCase;
  // late final guardarRutinaUseCase _guardarRutinaUseCase;
  // late final eliminarRutinaUseCase _eliminarRutinaUseCase;
  EntrenamientoScreenController() {
    final repo = HomeRepositoryImpl(); // Esto luego se puede inyectar
    _obtenerRutinaUseCase = ObtenerRutinaUseCase(repo);
    _obtenerRutinaActualUseCase = ObtenerRutinaUseCase(repo);
    // _guardarRutinaUseCase = GuardarRutinaUseCase(repo);
    // _eliminarRutinaUseCase = EliminarRutinaUseCase(repo);
  }
  Future<List<RutinaModel>> obtenerRutina() async {
    return await _obtenerRutinaUseCase.obtenerRutinas();
  }

  Future<RutinasUsuarioModel?> obtenerRutinaActual(String id) async {
    return await _obtenerRutinaActualUseCase.obtenerRutinaActual(id);
  }

  Future<void> extraerrutina(BuildContext context) async {
    final controllerusuarioRutina = EntrenamientoScreenController();
    final idUser = context.read<UserProvider>().usuario;
    String iduser = idUser?.id ?? '';
    RutinasUsuarioModel? rutina=null;
    rutina = await controllerusuarioRutina.obtenerRutinaActual(iduser);
    if (rutina != null) {
      context.read<UserRutinProvider>().setUsuarioRutina(rutina);
      //print('Rutina actual obtenida: ${rutina.rutinasIds[0]}');
    }else {
      print('No se pudo obtener la rutina actual para el usuario con ID: $iduser');
    }
    
  }
  Future<RutinaModel?> obtenerRutinaById(String id) async {
    return await _obtenerRutinaUseCase.obtenerRutinaById(id);
  }

}
