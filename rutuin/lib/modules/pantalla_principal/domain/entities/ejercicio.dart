class Ejercicio {
  final String nombre;
  final String series;
  final String repeticiones;
  final String rep;
  bool completado;
  String reps;
  String peso;

  Ejercicio({
    required this.nombre,
    required this.series,
    this.repeticiones = '',
    this.rep = '',
    this.completado = false,
    this.reps = '',
    this.peso = '',
  });

  factory Ejercicio.fromJson(Map<String, dynamic> json) {
    return Ejercicio(
      nombre: json['nombre'] ?? '',
      series: json['series'] ?? '',
      repeticiones: json['repeticiones'] ?? '',
      rep: json['rep'] ?? '',
      completado: json['completado'] ?? false,
      reps: json['reps'] ?? '',
      peso: json['peso'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'series': series,
        'repeticiones': repeticiones,
        'rep': rep,
        'completado': completado,
        'reps': reps,
        'peso': peso,
      };
  //obcion sin josn
  //funcion para convertir a mapa

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'series': series,
      'repeticiones': repeticiones,
      'rep': rep,
      'completado': completado,
      'reps': reps,
      'peso': peso,
    };
  }
}
