class UsuarioModel {
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

  UsuarioModel({
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

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      email: json['email'],
      contrasena: json['contraseña'],
      nombre: json['nombre'],
      medidas: Map<String, double>.from(json['medidas']),
      rol: json['rol'],
      rachaDiasEntrenando: json['racha_dias_entrenando'],
      sexo: json['sexo'],
      edad: json['edad'],
      fotoPerfil: json['foto_perfil'],
      peso: (json['peso'] ?? 0).toDouble(),
      altura: (json['altura'] ?? 0).toDouble(),
      objetivo: json['objetivo'],
      nivelActividad: json['nivel_actividad'],
      tipoEntrenamiento: json['tipo_entrenamiento'],
      tipoDieta: json['tipo_dieta'],
      dietaPersonalizada: json['dieta_personalizada'],
      dieta: json['dieta'] ?? [],
      notificaciones: Map<String, dynamic>.from(json['notificaciones']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'contraseña': contrasena,
      'nombre': nombre,
      'medidas': medidas,
      'rol': rol,
      'racha_dias_entrenando': rachaDiasEntrenando,
      'sexo': sexo,
      'edad': edad,
      'foto_perfil': fotoPerfil,
      'peso': peso,
      'altura': altura,
      'objetivo': objetivo,
      'nivel_actividad': nivelActividad,
      'tipo_entrenamiento': tipoEntrenamiento,
      'tipo_dieta': tipoDieta,
      'dieta_personalizada': dietaPersonalizada,
      'dieta': dieta,
      'notificaciones': notificaciones,
    };
  }
}
