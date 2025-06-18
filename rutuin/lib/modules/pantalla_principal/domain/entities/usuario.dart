class Usuario {
  final String email;
  final String contrasena;
  final String nombre;
  final Map<String, double> medidas;
  final String rol;
  final int rachaDiasEntrenando;
  final String sexo;
  final int edad;
  final String fotoPerfil;
  final double peso;
  final double altura;
  final String objetivo;
  final String nivelActividad;
  final String tipoEntrenamiento;
  final String tipoDieta;
  final bool dietaPersonalizada;
  final List<dynamic> dieta;
  final Map<String, dynamic> notificaciones;
  //recordar que notificaciones es un mapa que contiene los  siguientes campos:
  /*notificaciones: {
    'notificacion': true,
    'notificaciones_generales': {
      'historial_notificaciones': [
        {
          'tipo': 'bienvenida',
          'mensaje': '¡Bienvenido a Rutuin!',
          'fecha': DateTime.now().toIso8601String(),
        }
      ]
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
  },'''*/
  /*los tipos de notificaciones que importan son 
  generales,dieta,entrenamiento,
  recordatorios,actividades,noticias,
  promociones,eventos,recordatorios_dieta,
  recordatorios_entrenamiento,recordatorios_actividades,
  recordatorios_noticias,recordatorios_promociones,
  recordatorios_eventos
  y notificacion que es un booleano
  que indica si el usuario quiere recibir notificaciones
  generales o no.
  El historial de notificaciones es un array de objetos
  que contiene el tipo de notificacion, el mensaje y la fecha
  de la notificacion.
  El historial de notificaciones es un array de objetos
   */

  Usuario({
    required this.email,
    required this.contrasena,
    required this.nombre,
    required this.medidas,
    required this.rol,
    required this.rachaDiasEntrenando,
    required this.sexo,
    required this.edad,
    required this.fotoPerfil,
    required this.peso,
    required this.altura,
    required this.objetivo,
    required this.nivelActividad,
    required this.tipoEntrenamiento,
    required this.tipoDieta,
    required this.dietaPersonalizada,
    required this.dieta,
    required this.notificaciones,
  });
}
