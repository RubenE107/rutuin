import 'package:flutter/material.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/widgets/card_detalle_dias_rutina.dart';

class RutinasScreen extends StatelessWidget {
  final List<RutinaModel> rutinas;
  const RutinasScreen({super.key, required this.rutinas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rutinas disponibles")),
      body: ListView.builder(
        itemCount: rutinas.length,
        
        itemBuilder: (context, index) {

          final rutina = rutinas[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    rutina.nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(rutina.descripcion),
                  children: rutina.dias.map((dia) => DiaRutinaCard(dia: dia)).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text("Seleccionar"),
                        onPressed: () {
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Rutina '${rutina.nombre}' seleccionada")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.edit),
                        label: const Text("Editar"),
                        onPressed: () {
                          // Acción: Ir a pantalla de edición

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Función de edición no implementada")),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
