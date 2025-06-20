import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rutuin/modules/auth/presentation/providers/user_provider.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/controllers/entrenamiento_screen_controller.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/pages/entrenamiento_screen.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/pages/progreso_screen.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/pages/rutinas_screen.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/rutina_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = EntrenamientoScreenController();

  // int _selectedIndex = 0; // 🔸 Comentado porque no se usará navegación entre pestañas

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().usuario;

    return Scaffold(
      appBar: AppBar(title: Text('Hola, ${user?.nombre ?? 'Usuario'} 👋')),

      // 🔸 Mostramos directamente una sola pantalla
      body: EntrenamientoScreen(),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final rutinas = await controller.obtenerRutina();
          final nombre = context.read<RutinaProvider>().usuario?.nombre ?? 'No hay rutina seleccionada';

          // Mostrar diálogo
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('¡Aviso!'),
              content: Text("Actualmente la rutina activa es: $nombre"),
              actions: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) =>
                          states.contains(WidgetState.hovered)
                              ? Colors.blue.shade100
                              : Colors.white,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RutinasScreen(rutinas: rutinas),
                      ),
                    );
                  },
                  child: const Text('Continuar'),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) =>
                          states.contains(WidgetState.hovered)
                              ? Colors.blue.shade100
                              : Colors.white,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.fitness_center),
      ),

      // 🔸 Comentamos la barra de navegación inferior por ahora
      /*
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Entrenamiento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progreso',
          ),
        ],
      ),
      */
    );
  }
}
