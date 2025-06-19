import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';

import 'package:rutuin/modules/pantalla_principal/presentation/controllers/entrenamiento_screen_controller.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/pages/home_screen.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/rutina_provider.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/usuarioRutina_providers.dart';
//import 'package:rutuin/modules/pantalla_principal/presentation/providers/usuarioRutina_providers.dart';
import '../controllers/login_controller.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/controllers/entrenamiento_screen_controller.dart';

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final controller = LoginController();
  final controllerusuarioRutina = EntrenamientoScreenController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenido", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = emailCtrl.text.trim();
                final password = passwordCtrl.text.trim();

                final success = await controller.login(
                  context,
                  email,
                  password,
                );

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Login exitoso!')),
                  );
                  await controllerusuarioRutina.extraerrutina(context);
                  print('Rutina extraída correctamente');
                  String rutinaId =
                      context
                          .read<UserRutinProvider>()
                          .usuario!
                          .rutinasIds
                          .first
                          .rutina; // Asegúrate de que el usuario tenga rutinas asignadas
                  RutinaModel? rutina = await controllerusuarioRutina
                      .obtenerRutinaById(
                        rutinaId,
                      ); // Reemplaza 'rutinaId' con el ID real
                  context.read<RutinaProvider>().setRutina(rutina!);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                    (route) =>
                        false, // 👈 Esto elimina todas las rutas anteriores
                  );

                  // Aquí podrías navegar a otra pantalla
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Credenciales incorrectas  ')),
                  );
                  //Navigator.pushNamed(context, '/');
                }
              },
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}
