import 'package:flutter/material.dart';
import 'package:rutuin/core/theme/app_theme.dart';
import 'package:rutuin/modules/auth/presentation/pages/registrar_page.dart';
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
      theme:AppTheme.theme,
      routes: {
        '/': (context) => HomePage(),       // luego la creamos
        '/login': (context) => LoginPage(), // ya la tienes lista
        '/register': (context) =>RegisterPage(),
        '/home':(context)=>HomeScreen(),// Aquí puedes crear una página de registro
      },
    );
  }
}
