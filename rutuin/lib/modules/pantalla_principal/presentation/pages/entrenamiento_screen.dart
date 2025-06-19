import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/domain/entities/ejercicio.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/widgets/targeta_ejercicios.dart';

class EntrenamientoScreen extends StatefulWidget {
  const EntrenamientoScreen({super.key});

  @override
  State<EntrenamientoScreen> createState() => _EntrenamientoScreenState();
}

class _EntrenamientoScreenState extends State<EntrenamientoScreen> {
  // final List<Ejercicio> ejercicios = [
  //   Ejercicio(
  //     nombre: 'Press Banca',
  //     series: '4',
  //     repeticiones: "12",
  //     reps: '',
  //     peso: '',
  //     completado: false,
  //   ),
  //   // EjercicioItem(nombre: 'Press Inclinado', series: '4x10'),
  //   // EjercicioItem(nombre: 'Aperturas', series: '4x15'),
  //   // EjercicioItem(nombre: 'Fondos', series: '3x12'),
  // ];

  
  final rutina=Rutinacontrollers()
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
        ...ejercicios.map((e) => TarjetaEjercicio(ejercicio: e)),
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


