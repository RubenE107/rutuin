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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Asegúrate de que id no sea nulo
    final List<Widget> _screens = [
      EntrenamientoScreen(),
      ProgresoScreen(),
      //ietaScreen(),
    ];
    final user = context.watch<UserProvider>().usuario;
    //final rutina_actual =  await controller.obtenerRutinaActual(user!.id);

    return Scaffold(
      appBar: AppBar(title: Text('Hola, ${user?.nombre ?? 'Usuario'} 👋')),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final rutinas = await controller.obtenerRutina();
          final nombre =
              context.read<RutinaProvider>().usuario?.nombre ??
              'No hay rutina seleccionada';

          // Mostrar diálogo
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text('¡Aviso!'),
                  content: Text("Actualmente la rutina activa es: $nombre"),
                  actions: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<
                          Color?
                        >((Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors
                                .blue
                                .shade100; // Color cuando el mouse está encima
                          }
                          return Colors.white; // Color normal
                        }),
                        // Color del texto
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
                            builder:
                                (context) => RutinasScreen(rutinas: rutinas),
                          ),
                        );
                      },
                      child: const Text('Continuar'),
                    ),

                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<
                          Color?
                        >((Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors
                                .blue
                                .shade100; // Color cuando el mouse está encima
                          }
                          return Colors.white; // Color normal
                        }),
                        // Color del texto
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

          // Cerrar automáticamente el diálogo después de 2 segundos

          // Ir a RutinasScreen
        },
        child: const Icon(Icons.fitness_center),
      ),

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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.restaurant),
          //   label: 'Dieta',
          // ),
        ],
      ),
    );
  }
}
