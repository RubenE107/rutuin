class RutinasUsuarioModel {
  final String id;
  final String usuarioId;
  final List<RutinaInfo> rutinasIds;
  final String fechaInicio;
  final Progreso progreso;
  final List<String> notasPersonales;
  final List<Modificacion> modificaciones;
  final String? dia1;

  RutinasUsuarioModel({
    required this.id,
    required this.usuarioId,
    required this.rutinasIds,
    required this.fechaInicio,
    required this.progreso,
    required this.notasPersonales,
    required this.modificaciones,
    this.dia1,
  });
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
}

class Progreso {
  final int diasCompletados;
  final String ultimoDiaCompletado;
  Progreso({
    required this.diasCompletados,
    required this.ultimoDiaCompletado,
  });
}

class Modificacion {
  final String dia;
  final List<String> ejerciciosExtra;

  Modificacion({
    required this.dia,
    required this.ejerciciosExtra,
  });
}
