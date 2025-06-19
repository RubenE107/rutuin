// lib/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hola, Rutuin!")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Text("iniciar sesión"),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            
          ),
          Center(
            child: ElevatedButton(
              child: Text("registrarse"),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ),
          // Center(
          //   child: ElevatedButton(
          //     child: Text("Entrar"),
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/home');
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
