import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final controller = LoginController();

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

                final success = await controller.login(email, password);

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Login exitoso!')),
                  );
                  // Aquí podrías navegar a otra pantalla
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Credenciales incorrectas')),
                  );
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
