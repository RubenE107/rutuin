import 'package:flutter/material.dart';
import 'package:rutuin/core/theme/app_theme.dart';
import 'package:rutuin/modules/auth/presentation/pages/registrar_page.dart';
import 'modules/auth/presentation/pages/login_page.dart'; //

import 'homePage.dart'; // Importa la página de inicio

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Coach',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme:AppTheme.intenseRed,
      routes: {
        '/': (context) => HomePage(),       // luego la creamos
        '/login': (context) => LoginPage(), // ya la tienes lista
        '/register': (context) =>RegisterPage(), // Aquí puedes crear una página de registro
      },
    );
  }
}
