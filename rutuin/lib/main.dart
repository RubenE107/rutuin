import 'package:flutter/material.dart';
import 'package:rutuin/core/theme/app_theme.dart';
import 'package:rutuin/modules/auth/presentation/pages/registrar_page.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/rutina_provider.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/usuarioRutina_providers.dart';
import 'modules/auth/presentation/pages/login_page.dart'; //

import 'homePage.dart'; // Importa la página de inicio
import 'modules/pantalla_principal/presentation/pages/home_screen.dart'; 
import 'modules/auth/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_ES', null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => UserRutinProvider()), // Asegúrate de importar el provider correcto
        ChangeNotifierProvider(create: (_)=> RutinaProvider()),
        ChangeNotifierProvider(create: (_) => RutinaDiaProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Coach',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme:AppTheme.minimalLight,
      routes: {
        '/': (context) => HomePage(),       // luego la creamos
        '/login': (context) => LoginPage(), // ya la tienes lista
        '/register': (context) =>RegisterPage(),
        '/home':(context)=>HomeScreen(),// Aquí puedes crear una página de registro // Aquí puedes crear una página para ver rutinas
      },
    );
  }
}
