class Rutina {
  final String nombre;
  final String descripcion;
  final String recomendado;
  final String noRecomendado;
  final List<DiaRutina> dias;

  Rutina({
    required this.nombre,
    required this.descripcion,
    required this.recomendado,
    required this.noRecomendado,
    required this.dias,
  });
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
}

class EjercicioRutina {
  final String nombre;
  final String series;
  final String repeticiones;
  final String rep;
  bool completado;
  String reps;
  String peso;

  EjercicioRutina({
    required this.nombre,
    required this.series,
    this.completado = false,
    this.reps = '',
    this.peso = '',
    this.repeticiones = '',
    this.rep = '',
  });
}
