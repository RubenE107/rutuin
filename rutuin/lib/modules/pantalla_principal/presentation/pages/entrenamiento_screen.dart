import 'package:flutter/material.dart';

class EntrenamientoScreen extends StatefulWidget {
  const EntrenamientoScreen({super.key});

  @override
  State<EntrenamientoScreen> createState() => _EntrenamientoScreenState();
}

class _EntrenamientoScreenState extends State<EntrenamientoScreen> {
  final List<EjercicioItem> ejercicios = [
    EjercicioItem(nombre: 'Press Banca', series: '4x12'),
    EjercicioItem(nombre: 'Press Inclinado', series: '4x10'),
    EjercicioItem(nombre: 'Aperturas', series: '4x15'),
    EjercicioItem(nombre: 'Fondos', series: '3x12'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          '🏋️ Entrenamiento del Día - Pecho',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        ...ejercicios.map((e) => Card(
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
                      title: Text('${e.nombre} (${e.series})'),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Repeticiones',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) => e.reps = val,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Peso (kg)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) => e.peso = val,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
        const SizedBox(height: 20),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Notas del día',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            // Aquí podrías guardar el entrenamiento
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Entrenamiento guardado ✅')),
            );
          },
          icon: const Icon(Icons.check_circle),
          label: const Text('Finalizar Entrenamiento'),
        ),
      ],
    );
  }
}

class EjercicioItem {
  final String nombre;
  final String series;
  bool completado;
  String reps;
  String peso;

  EjercicioItem({
    required this.nombre,
    required this.series,
    this.completado = false,
    this.reps = '',
    this.peso = '',
  });
}
