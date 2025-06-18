import 'package:flutter/material.dart';
import 'package:rutuin/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:rutuin/modules/auth/domain/usecases/register_usecase.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();
  final controller = RegisterController(RegisterUseCase(AuthRepositoryImpl()));


  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Crear Cuenta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField (
              controller: nameCtrl,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passCtrl,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: confirmPassCtrl,
              decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
              obscureText: true,

            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Registrar"),
              onPressed: () async {
                
                final msg = await controller.validateAndRegister(
                  emailCtrl.text.trim(),
                  passCtrl.text.trim(),
                  nameCtrl.text.trim(),
                  confirmPassCtrl.text.trim(),
                );

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(msg),
                ));
                if (msg == "Registro exitoso") {
                  Navigator.pushNamed(context, '/');
                }

              },
            )
          ],
        ),
      ),
    );
  }
}
