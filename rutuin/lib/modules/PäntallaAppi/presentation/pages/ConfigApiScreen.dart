import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigApiScreen extends StatefulWidget {
  const ConfigApiScreen({Key? key}) : super(key: key);

  @override
  State<ConfigApiScreen> createState() => _ConfigApiScreenState();
}

class _ConfigApiScreenState extends State<ConfigApiScreen> {
  final TextEditingController _controller = TextEditingController();
  String _mensaje = '';

  @override
  void initState() {
    super.initState();
    _cargarUrl();
  }

  Future<void> _cargarUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? url = prefs.getString('api_url');
    if (url != null) {
      _controller.text = url;
    }
  }

  Future<void> _guardarUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_url', _controller.text.trim());
    setState(() {
      _mensaje = '¡Enlace guardado correctamente!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de API'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo ejemplo, cambia por el tuyo si lo tienes como widget o asset
              Icon(Icons.fitness_center, size: 60, color: Colors.black54),

              const SizedBox(height: 24),
              Text(
                'Introduce el enlace de tu API para conectar la app con tu servidor.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'URL de la API',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'https://miapi.com/rutuin',
                ),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _guardarUrl,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(double.infinity, 48),
                ),
                child: const Text('Guardar'),
              ),
              if (_mensaje.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  _mensaje,
                  style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold),
                ),
              ],
              const SizedBox(height: 12),
              Text(
                'Puedes cambiar este enlace en cualquier momento desde la configuración.',
                style: TextStyle(fontSize: 13, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
