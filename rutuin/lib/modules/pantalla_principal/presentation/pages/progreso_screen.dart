import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgresoScreen extends StatelessWidget {
  const ProgresoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> historialMock = [
      {'fecha': '2025-06-16', 'musculos': 'Espalda y bíceps'},
      {'fecha': '2025-06-15', 'musculos': 'Pecho y tríceps'},
      {'fecha': '2025-06-14', 'musculos': 'Piernas'},
    ];

    
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            '📈 Progreso General',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.local_fire_department, color: Colors.orange),
              title: const Text('Racha de días entrenando'),
              trailing: const Text('🔥 5 días'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Sesiones totales'),
              trailing: const Text('43'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Último entrenamiento'),
              trailing: Text(
                DateFormat('dd/MM/yyyy').format(
                  DateTime.tryParse(historialMock.first['fecha'] ?? '') ?? DateTime.now(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '🗓️ Últimos entrenamientos realizados',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Column(
            children: historialMock.map((item) {
              final fecha = DateTime.tryParse(item['fecha']) ?? DateTime.now();
              final formateado = DateFormat('EEEE, d MMM', 'es_ES').format(fecha);
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: const Icon(Icons.fitness_center_outlined),
                  title: Text(item['musculos']),
                  subtitle: Text(formateado),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Aquí podrías navegar a una página de historial detallado
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Historial detallado no implementado')),
              );
            },
            icon: const Icon(Icons.history),
            label: const Text('Ver historial completo'),
          ),
        ],
      );
  }
}
      
  
