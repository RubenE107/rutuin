import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rutuin/modules/auth/presentation/providers/user_provider.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/pages/entrenamiento_screen.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/pages/progreso_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    EntrenamientoScreen(),
    ProgresoScreen(),
    //ietaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().usuario;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hola, ${user?.nombre ?? ''} 👋'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
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
