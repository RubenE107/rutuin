import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/domain/entities/ejercicio.dart';

class TarjetaEjercicio extends StatefulWidget {
  final EjercicioRutina ejercicio;
  final String recomendacion;

  const TarjetaEjercicio({
    Key? key,
    required this.ejercicio,
    this.recomendacion =
        '',
  }) : super(key: key);

  @override
  State<TarjetaEjercicio> createState() => _TarjetaEjercicioState();
}

class _TarjetaEjercicioState extends State<TarjetaEjercicio> {
  late EjercicioRutina e;
  late List<TextEditingController> repsController;
  late TextEditingController seriesController;
  late TextEditingController nombreController;
  late bool completado;

  @override
  void initState() {
    super.initState();
    e = widget.ejercicio;
    seriesController = TextEditingController(text: e.series.toString());
    repsController =
        repsController =
            e.repeticiones
                .map((rep) => TextEditingController(text: rep.toString()))
                .toList();
    completado = false;
  }

  @override
  void dispose() {
    super.dispose();
    repsController.forEach((controller) {
      controller.dispose();
    });
    seriesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              value: completado,
              onChanged: (val) {
                setState(() {
                  completado = val ?? false;
                });
              },
              title: Text(
                e.series == 0
                    ? e.nombre
                    : '${e.nombre} (${e.series} series)',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Tipo: ${widget.recomendacion}'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //print('e.repeticiones: ${e.repeticiones}'),
                      ...e.repeticiones.isEmpty
                          ? [const Text('No hay repeticiones asignadas')]
                          : [
                      Text('Repeticiones:'),
                      ...e.repeticiones.asMap().entries.map((entry) {
                        int index = entry.key;
                        String value = entry.value.toString();
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextField(
                            controller: repsController[index],
                            decoration: InputDecoration(
                              labelText: 'Reps ${index + 1}',
                              border: const OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              final int? parsedVal = int.tryParse(val);
                              if (parsedVal == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Por favor, ingresa un número válido.',
                                    ),
                                  ),
                                );
                                return;
                              }
                              e.repeticiones[index] = parsedVal;
                            },
                          ),
                        );
                      }).toList(),]
                    ],
                  ),
                ),
                const SizedBox(width: 10),

                // Expanded(
                //   child: TextField(
                //     controller: pesoController,
                //     decoration: const InputDecoration(
                //       labelText: 'Peso (kg)',
                //       border: OutlineInputBorder(),
                //     ),
                //     keyboardType: TextInputType.number,
                //     onChanged: (val) {
                //       e.peso = val;
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
