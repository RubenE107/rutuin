import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/domain/entities/ejercicio.dart';

class TarjetaEjercicio extends StatefulWidget {
  final Ejercicio ejercicio;

  const TarjetaEjercicio({Key? key, required this.ejercicio}) : super(key: key);

  @override
  State<TarjetaEjercicio> createState() => _TarjetaEjercicioState();
}

class _TarjetaEjercicioState extends State<TarjetaEjercicio> {
  late Ejercicio e;
  late TextEditingController repsController;
  late TextEditingController pesoController;

  @override
  void initState() {
    super.initState();
    e = widget.ejercicio;
    repsController = TextEditingController(text: e.reps);
    pesoController = TextEditingController(text: e.peso);
  }

  @override
  void dispose() {
    repsController.dispose();
    pesoController.dispose();
    super.dispose();
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
              value: e.completado,
              onChanged: (val) {
                setState(() {
                  e.completado = val ?? false;
                });
              },
              title: Text('${e.nombre} (${e.series} series)'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: repsController,
                    decoration: const InputDecoration(
                      labelText: 'Repeticiones',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      e.reps = val;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: pesoController,
                    decoration: const InputDecoration(
                      labelText: 'Peso (kg)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      e.peso = val;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}