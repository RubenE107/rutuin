import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rutuin/modules/auth/presentation/providers/user_provider.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/usuarioRutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/data/repositories/home_repository_impl.dart';
//import 'package:rutuin/modules/pantalla_principal/domain/repositories/i_home_repository.dart';
import 'package:rutuin/modules/pantalla_principal/domain/usecases/obtener_rutina_usecase.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/rutina_provider.dart';
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
    RutinasUsuarioModel? rutina = null;
    rutina = await controllerusuarioRutina.obtenerRutinaActual(iduser);
    if (rutina != null) {
      context.read<UserRutinProvider>().setUsuarioRutina(rutina);
      //print('Rutina actual obtenida: ${rutina.rutinasIds[0]}');
    } else {
      print(
        'No se pudo obtener la rutina actual para el usuario con ID: $iduser',
      );
    }
  }

  Future<RutinaModel?> obtenerRutinaById(String id) async {
    print("Obteniendo rutina por ID: $id");
    return await _obtenerRutinaUseCase.obtenerRutinaById(id);
  }

  Future<RutinasUsuarioModel?> selecionarNuevaRutina(
    BuildContext context,
    String idUsuario,
    String idRutina,
  ) async {
    if (context.read<RutinaProvider>().tieneRutina == true) {
      final userRutinaProvider = context.read<UserRutinProvider>();
      final rutinaProvider = context.read<RutinaProvider>();
      print("No hay rutina actual, no se puede reemplazar.");
      //si no har rutina se agrega uno vacio para evitar errores
      List<RutinaInfo> listaRutinas = userRutinaProvider.usuario!.rutinasIds;

      // Desactivar actual
      final index = listaRutinas.indexWhere((e) => e.estado == 'activo');
      if (index != -1) {
        final original = listaRutinas[index];
        listaRutinas[index] = RutinaInfo(
          rutina: original.rutina,
          estado: 'inactivo',
          fechaInicio: original.fechaInicio,
        );
      }

      // Insertar nueva rutina
      listaRutinas.insert(
        0,
        RutinaInfo(
          rutina: idRutina,
          estado: 'activo',
          fechaInicio: DateTime.now().toIso8601String(),
        ),
      );

      print("Reemplazando rutina actual con la nueva rutina: $idRutina");
      final rutina = await obtenerRutinaById(idRutina);
      if (rutina != null) {
        rutinaProvider.setRutina(rutina);
        print("Rutina obtenida: ${rutina.nombre}");
      }

      return userRutinaProvider.usuario;
    } else {
  final userRutinaProvider = context.read<UserRutinProvider>();
  final rutinaProvider = context.read<RutinaProvider>();
  print("No hay rutina actual, creando una nueva.");

  // Creamos la lista de rutinas con solo la nueva activa
  List<RutinaInfo> listaRutinas = [
    RutinaInfo(
      rutina: idRutina,
      estado: 'activo',
      fechaInicio: DateTime.now().toIso8601String(),
    ),
  ];

  // Creamos el usuario con esa rutina activa
  final nuevaRutinaUsuario = RutinasUsuarioModel(
    id: idUsuario,
    rutinasIds: listaRutinas,
    usuarioId: '', // Si tienes un valor real, ponlo aquí
    fechaInicio: DateTime.now().toIso8601String(),
    progreso: null,
    notasPersonales: [],
    modificaciones: [],
  );

  userRutinaProvider.setUsuarioRutina(nuevaRutinaUsuario); // <- Actualiza el provider del usuario
  print("Se creó la primera rutina para el usuario.");
  print("id de rutina es: $idRutina");
  final rutina =  await _obtenerRutinaUseCase.obtenerRutinaById(idRutina);
  print(rutina?.nombre ?? "No se encontró rutina");

  if (rutina != null) {
    rutinaProvider.setRutina(rutina); // <- Actualiza el provider de la rutina seleccionada
    print("Rutina guardada en RutinaProvider: ${rutina.nombre}");
  }

  return userRutinaProvider.usuario; // <- Regresa el usuario actualizado
}
  }

  // Future<void> guardarRutina(RutinaModel rutina) async {
  //   await _guardarRutinaUseCase.guardarRutina(rutina);
  // }

  // Future<void> eliminarRutina(String id) async {
  //   await _eliminarRutinaUseCase.eliminarRutina(id);
  // }
}
