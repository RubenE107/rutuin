import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rutuin/core/theme/config.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/usuarioRutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/domain/repositories/i_home_repository.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final String baseUrlRutina =
      appConfig.appRepository +
      'rutinas'; // Ruta del archivo JSON donde se guardará la rutina
  final String baseUrlUsuarioRutina =
      appConfig.appRepository +
      'usuarioRutina'; // Ruta del archivo JSON donde se guardará la rutina
  @override
  Future<List<RutinaModel>> getRutinas() async {
    final url = Uri.parse('$baseUrlRutina/obtenerRutinas');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<RutinaModel> rutinas =
            data.map((item) => RutinaModel.fromJson(item)).toList();
        //print('✅ Rutinas obtenidas correctamente: ${rutinas.first.nombre}');
        return rutinas;
      } else {
        print('❌ Error al obtener la rutina: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('❌ Error al realizar la solicitud: $e');
      return [];
    }
  }

  @override
  Future<RutinasUsuarioModel?> getRutinaActual(String id) async {
    final url = Uri.parse('$baseUrlUsuarioRutina/$id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print('✅ Rutina actual obtenida correctamente: ${data['usuario_id']}');
        RutinasUsuarioModel rutinaActual = RutinasUsuarioModel.fromJson(data);
        print('Rutina actual: ${rutinaActual.rutinasIds.first.rutina}');
        //print('✅ Rutina actual obtenida correctamente: ${rutinaActual.nombre}');
        return rutinaActual;
      } else {
        print('❌ Error al obtener la rutina actual: ${response.statusCode}');
        //throw Exception('Error al obtener la rutina actual');
        return null;
      }
    } catch (e) {
      print('❌ Error al realizar la solicitud: $e');
      //throw Exception('Error al realizar la solicitud: $e');
      return null;
    }
  }

  //obtener 1 rutina por id
  @override
  Future<RutinaModel?> getRutinaById(String id) async {
    print("Obteniendo rutina por ID: $id");
    final url = Uri.parse('$baseUrlRutina/$id');
    print("URL: $url");
    try {
      print("Realizando solicitud a la URL: $url");
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      print("Obteniendo rutina por ID despues de response: $id");
      if (response.statusCode == 200) {
        print('✅ Rutina obtenida correctamente: ${response.body}');
        final Map<String, dynamic> data = jsonDecode(response.body);
        return RutinaModel.fromJson(data);
      } else {
        print('❌ Error al obtener la rutina por ID: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('❌ Error al realizar la solicitud: $e');
      return null;
    }
  }

  @override
  Future<RutinasUsuarioModel?> selecionarNuevaRutina(
    String idUsuario,
    List<RutinaInfo> listaRutinas,
  ) async {
    final url = Uri.parse('$baseUrlUsuarioRutina/$idUsuario');
    try {
      final response = await http.put(
        url, // asegúrate que la ruta sea /usuarioRutina/:id
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'usuario_id': idUsuario,
          'rutinas_ids': listaRutinas.map((e) => e.toJson()).toList(),
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return RutinasUsuarioModel.fromJson(data);
      } else {
        print('❌ Error al seleccionar nueva rutina: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('❌ Error al realizar la solicitud: $e');
      return null;
    }
  }
}
