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
    return await _obtenerRutinaUseCase.obtenerRutinaById(id);
  }

  Future<RutinasUsuarioModel?> selecionarNuevaRutina(
    BuildContext context,
    String idUsuario,
    String idRutina,
  ) async {
    List<RutinaInfo> listaRutinas =
        context.read<UserRutinProvider>().usuario!.rutinasIds;

    listaRutinas.add(
      RutinaInfo(
        rutina: idRutina,
        estado: 'activo',
        fechaInicio: DateTime.now().toIso8601String(),
      ),
    );
    //primero desactivo la rutina actual
    final rutinas = context.read<UserRutinProvider>().usuario!.rutinasIds;

    final index = rutinas.indexWhere((element) => element.estado == 'activo');
    if (index != -1) {
      final original = rutinas[index];
      rutinas[index] = RutinaInfo(
        rutina: original.rutina,
        estado: 'inactivo',
        fechaInicio: original.fechaInicio,
      );
    }

    //añado la nueva rutina al principio de la lista
    Provider.of<UserRutinProvider>(
      context,
      listen: false,
    ).usuario!.rutinasIds.insert(
      0,
      RutinaInfo(
        rutina: idRutina,
        estado: 'Activo',
        fechaInicio: DateTime.now().toIso8601String(),
      ),
    );

    //ahora reeplazo la rutina anterior con el nuevo desde la lista de rutinas
    print("Reemplazando rutina actual con la nueva rutina: $idRutina");
    final rutina=await obtenerRutinaById(idRutina);
    print("Rutina obtenida: ${rutina?.nombre}");
    context.read<RutinaProvider>().setRutina(rutina!);
    print(context.read<RutinaProvider>().usuario!.nombre);
    // context.read<UserRutinProvider>().usuario!.rutinasIds.add(RutinaInfo(
    //     rutina: idRutina,
    //     estado: 'nuevo',
    //     fechaInicio: DateTime.now().toIso8601String()));
    // for (var rutina in listaRutinas) {
    //   print(
    //     'Rutina: ${rutina.rutina}, Estado: ${rutina.estado}, Fecha Inicio: ${rutina.fechaInicio}',
    //   );
    // }
    // return await _obtenerRutinaUseCase.selecionarNuevaRutina(
    //     idUsuario, listaRutinas);
  }
}
