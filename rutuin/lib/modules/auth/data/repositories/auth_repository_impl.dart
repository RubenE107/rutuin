import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rutuin/core/theme/config.dart';
import '../../domain/repositories/i_auth_repository.dart';


class AuthRepositoryImpl implements IAuthRepository {
  final String baseUrl =appConfig.appRepository +'usuarios'; // en emulador Android usa 10.0.2.2

  @override
  Future<String?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'contraseña': password}),
      );
      print(
        'Enviando solicitud a: $url con datos: correo: $email, contraseña: $password',
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final usuario = data['usuario'];
        final id = usuario['id']; // ✅ aquí obtienes el ID
        final nombre = usuario['nombre'];

        print('✅ Login ID: $id');

        // Puedes guardar el ID o pasarlo a HomeScreen
        return id;
      } else {
        print('❌ Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('❌ Error al realizar la solicitud: $e');
      return null;
    }
  }

  Future<bool> register(String email, String password, String name) async {
    final Map<String, dynamic> medidas = {
      'altura': 0.0,
      'peso': 0.0,
      'cintura': 0.0,
      'cadera': 0.0,
      'pecho': 0.0,
      'hombros': 0.0,
      'brazos': 0.0,
      'muslo': 0.0,
      'pantorrilla': 0.0,
      'antebrazo': 0.0,
      'cuello': 0.0,
      'grasa_corporal': 0.0,
      'masa_muscular': 0.0,
    };
    final url = Uri.parse('$baseUrl/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'contraseña': password,
        'nombre': name,
        'medidas': medidas,
        'rol': 'usuario',
        'racha_dias_entrenando': 0,
        'sexo': 'no especificado',

        'edad': 0,
        'foto_perfil': '',
        'peso': 0.0,
        'altura': 0.0,
        'objetivo': 'no especificado',
        'nivel_actividad': 'no especificado',
        'tipo_entrenamiento': 'no especificado',
        'tipo_dieta': 'no especificado',
        'dieta_personalizada': false,
        'dieta': [],
        'notificaciones': {
          'notificacion': true,
          'notificaciones_generales': {
            'historial_notificaciones': [
              {
                'tipo': 'bienvenida',
                'mensaje': '¡Bienvenido a Rutuin!',
                'fecha': DateTime.now().toIso8601String(),
              },
            ],
          },
          'notificaciones_dieta': false,
          'notificaciones_entrenamiento': false,
          'notificaciones_recordatorios': false,
          'notificaciones_actividades': false,
          'notificaciones_noticias': false,
          'notificaciones_promociones': false,
          'notificaciones_eventos': false,
          'notificaciones_recordatorios_dieta': false,
          'notificaciones_recordatorios_entrenamiento': false,
          'notificaciones_recordatorios_actividades': false,
          'notificaciones_recordatorios_noticias': false,
          'notificaciones_recordatorios_promociones': false,
          'notificaciones_recordatorios_eventos': false,
        },
      }),
    );
    print(
      'Enviando solicitud a: $url con datos: correo: $email, contraseña: $password, nombre: $name',
    );
    if (response.statusCode == 200) {
      print('✅ Registro exitoso: ${response.body}');
      return true;
    } else {
      print('❌ Error: ${response.body}');
      return false;
    }

  }
  @override
Future<Map<String, dynamic>?> getUserData(String userId) async {
  final url = Uri.parse('$baseUrl/$userId'); // ✅ sin los ":"
  try {
    print('📤 Enviando solicitud a: $url con ID de usuario: $userId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('✅ Datos del usuario obtenidos correctamente');
      return data;
    } else {
      print('❌ Error al obtener datos del usuario: ${response.statusCode} - ${response.body}');
      return null;
    }
  } catch (e) {
    print('❌ Error al realizar la solicitud: $e');
    return null;
  }
}

}
