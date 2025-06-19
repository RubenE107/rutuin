
import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';

class DiaRutinaCard extends StatelessWidget {
  final DiaRutina dia;
  const DiaRutinaCard({super.key, required this.dia});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${dia.dia}: ${dia.actividad}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...dia.detalle.ejercicios.map(
            (ej) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 18)),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: ej.nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: 'Series: ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            text: '${ej.series}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(text: '   '),
                          TextSpan(
                            text: 'Reps: ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                            text: ej.repeticiones.join(', '),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (dia.detalle.recomendacion != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Recomendación: ${dia.detalle.recomendacion}',
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
