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
    this.completado = false,
    this.reps = '',
    this.peso = '',
    this.repeticiones = '',
    this.rep = '',
    
  });
}