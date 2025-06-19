import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';

class TarjetaEditableEjercicio extends StatelessWidget {
  final EjercicioRutina ejercicio;
  final void Function(String)? onNombreChanged;
  final void Function(String)? onSeriesChanged;
  final void Function(List<int>)? onRepsChanged;

  const TarjetaEditableEjercicio({
    super.key,
    required this.ejercicio,
    this.onNombreChanged,
    this.onSeriesChanged,
    this.onRepsChanged,
  });

  @override
  Widget build(BuildContext context) {
    final repsController = TextEditingController(
      text: ejercicio.repeticiones.join(', '),
    );
    final seriesController = TextEditingController(text: '${ejercicio.series}');
    final nombreController = TextEditingController(text: ejercicio.nombre);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre del ejercicio'),
              onChanged: onNombreChanged,
            ),
            TextField(
              controller: seriesController,
              decoration: const InputDecoration(labelText: 'Series'),
              keyboardType: TextInputType.number,
              onChanged: onSeriesChanged,
            ),
            TextField(
              controller: repsController,
              decoration: const InputDecoration(labelText: 'Repeticiones (ej. 12, 10, 8)'),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                final nuevaLista = value
                    .split(',')
                    .map((e) => int.tryParse(e.trim()))
                    .whereType<int>()
                    .toList();
                onRepsChanged?.call(nuevaLista);
              },
            ),
          ],
        ),
      ),
    );
  }
}
