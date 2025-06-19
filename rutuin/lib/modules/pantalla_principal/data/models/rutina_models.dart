class RutinaModel {
  late final String nombre;
  late final String descripcion;
  final String recomendado;
  final String noRecomendado;
  final List<DiaRutina> dias;

  RutinaModel({
    required this.nombre,
    required this.descripcion,
    required this.recomendado,
    required this.noRecomendado,
    required this.dias,
  });

  factory RutinaModel.fromJson(Map<String, dynamic> json) {
    return RutinaModel(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      recomendado: json['recomendado'],
      noRecomendado: json['no_recomendado'],
      dias: (json['dias'] as List)
          .map((dia) => DiaRutina.fromJson(dia))
          .toList(),
    );
  }
}

class DiaRutina {
  final String dia;
  final String actividad;
  final DetalleRutina detalle;

  DiaRutina({
    required this.dia,
    required this.actividad,
    required this.detalle,
  });

  factory DiaRutina.fromJson(Map<String, dynamic> json) {
    return DiaRutina(
      dia: json['dia'],
      actividad: json['actividad'],
      detalle: DetalleRutina.fromJson(json['detalle']),
    );
  }
}

class DetalleRutina {
  final String grupo;
  final List<EjercicioRutina> ejercicios;
  final String? recomendacion;

  DetalleRutina({
    required this.grupo,
    required this.ejercicios,
    this.recomendacion,
  });

  factory DetalleRutina.fromJson(Map<String, dynamic> json) {
    return DetalleRutina(
      grupo: json['grupo'],
      ejercicios: (json['ejercicios'] as List)
          .map((e) => EjercicioRutina.fromJson(e))
          .toList(),
      recomendacion: json['recomendacion'],
    );
  }
}

class EjercicioRutina {
  late final String nombre;
  late final int series;
  late final List<int> repeticiones;

  EjercicioRutina({
    required this.nombre,
    required this.series,
    required this.repeticiones,
  });

  factory EjercicioRutina.fromJson(Map<String, dynamic> json) {
    return EjercicioRutina(
      nombre: json['nombre'],
      series: json['series'],
      repeticiones: (json['repeticiones'] as List).map((e) => e as int).toList(),
    );
  }
}
