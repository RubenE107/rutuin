class RutinasUsuarioModel {
  final String id;
  final String usuarioId;
  final List<RutinaInfo> rutinasIds;
  final String fechaInicio;
  final Progreso? progreso;
  final List<String> notasPersonales;
  final List<Modificacion> modificaciones;
  final String? dia1;

  RutinasUsuarioModel({
    required this.id,
    required this.usuarioId,
    required this.rutinasIds,
    required this.fechaInicio,
     this.progreso,
    required this.notasPersonales,
    required this.modificaciones,
    this.dia1,
  });

  factory RutinasUsuarioModel.fromJson(Map<String, dynamic> json) {
    return RutinasUsuarioModel(
    id: json['_id'],
      usuarioId: json['usuario_id'],
      rutinasIds:
          (json['rutinas_ids'] as List)
              .map((e) => RutinaInfo.fromJson(e))
              .toList(),
      fechaInicio: json['fecha_inicio'],
      progreso: Progreso.fromJson(json['progreso']),
      notasPersonales: (json['notas_personales'] is List)
    ? (json['notas_personales'] as List).map((e) => e.toString()).toList()
    : json['notas_personales'] != null
        ? [json['notas_personales'].toString()]
        : [],

      modificaciones: (json['modificaciones'] is List)
    ? (json['modificaciones'] as List)
        .map((e) => e is Map<String, dynamic>
            ? Modificacion.fromJson(e)
            : Modificacion(dia: '', ejerciciosExtra: []))
        .toList()
    : [],

      dia1: json['dia1'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': {'\$oid': id},
    'usuario_id': usuarioId,
    'rutinas_ids': rutinasIds.map((e) => e.toJson()).toList(),
    'fecha_inicio': fechaInicio,
    'progreso': progreso?.toJson(),
    'notas_personales': notasPersonales,
    'modificaciones': modificaciones.map((e) => e.toJson()).toList(),
    'dia1': dia1,
  };
}

class RutinaInfo {
  final String rutina; // ID rutina
  final String estado;
  final String fechaInicio;

  RutinaInfo({
    required this.rutina,
    required this.estado,
    required this.fechaInicio,
  });

  factory RutinaInfo.fromJson(Map<String, dynamic> json) {
    //print("entro a rutina info");
    return RutinaInfo(
      rutina: json['rutina'],
      estado: json['estado'],
      fechaInicio: json['fecha_inicio'],
    );
  }

  Map<String, dynamic> toJson() => {
    'rutina': rutina,
    'estado': estado,
    'fecha_inicio': fechaInicio,
  };
}

class Progreso {
  final int diasCompletados;
  final String ultimoDiaCompletado;

  Progreso({required this.diasCompletados, required this.ultimoDiaCompletado});

  factory Progreso.fromJson(Map<String, dynamic> json) {
    //print("entro a progreso");
    return Progreso(
      diasCompletados: json['dias_completados'],
      ultimoDiaCompletado: json['ultimo_dia_completado'],
    );
  }

  Map<String, dynamic> toJson() => {
    'dias_completados': diasCompletados,
    'ultimo_dia_completado': ultimoDiaCompletado,
  };
}

class Modificacion {
  final String dia;
  final List<String> ejerciciosExtra;

  Modificacion({required this.dia, required this.ejerciciosExtra});

  factory Modificacion.fromJson(Map<String, dynamic> json) {
    return Modificacion(
      dia: json['dia'] ?? '',
      ejerciciosExtra:
          (json['ejercicios_extra'] is List)
              ? (json['ejercicios_extra'] as List)
                  .map((e) => e.toString())
                  .toList()
              : json['ejercicios_extra'] != null
              ? [json['ejercicios_extra'].toString()]
              : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'dia': dia,
    'ejercicios_extra': ejerciciosExtra,
  };
}
