import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/widgets/targeta_editable_ejercicio.dart';

class EditarRutinaScreen extends StatefulWidget {
  final RutinaModel rutina;
  const EditarRutinaScreen({super.key, required this.rutina});

  @override
  State<EditarRutinaScreen> createState() => _EditarRutinaScreenState();
}

class _EditarRutinaScreenState extends State<EditarRutinaScreen> {
  late RutinaModel rutinaEditada;

  @override
  void initState() {
    super.initState();
    rutinaEditada = widget.rutina;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar rutina: ${rutinaEditada.nombre}")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...rutinaEditada.dias.map((dia) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dia.dia,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ...dia.detalle.ejercicios.map((ejercicio) => TarjetaEditableEjercicio(
                        ejercicio: ejercicio,
                        onNombreChanged: (val) {
                          setState(() => ejercicio.nombre = val);
                        },
                        onSeriesChanged: (val) {
                          setState(() => ejercicio.series = int.tryParse(val) ?? ejercicio.series);
                        },
                        onRepsChanged: (val) {
                          setState(() => ejercicio.repeticiones = val);
                        },
                      )),
                  const Divider(height: 32),
                ],
              )),
          // ElevatedButton.icon(
          //   onPressed: () {
              
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('Rutina guardada exitosamente ✅')),
          //     );
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(Icons.save),
          //   label: const Text("Guardar cambios"),
          // )
        ],
      ),
    );
  }
}
