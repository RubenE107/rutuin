import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rutuin/modules/auth/presentation/providers/user_provider.dart';
import 'package:rutuin/modules/pantalla_principal/data/models/rutina_models.dart';
import 'package:rutuin/modules/pantalla_principal/domain/entities/ejercicio.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/rutina_provider.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/providers/usuarioRutina_providers.dart';
import 'package:rutuin/modules/pantalla_principal/presentation/widgets/targeta_ejercicios.dart';

class EntrenamientoScreen extends StatelessWidget {
  EntrenamientoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //final controller = EntrenamientoScreenController();
    final user = context.watch<UserProvider>().usuario;
    final userID = user?.id;
    String msj = '';
    if (userID == null) {
      msj = 'Buscando rutina...';
      return Center(
        child: Text(msj, style: Theme.of(context).textTheme.headlineSmall),
      );
    } else {
      final rutina = context.read<UserRutinProvider>().tieneRutina;
      if (rutina == true) {
        msj = '¡Listo para entrenar! 💪';
        final rutinaUsuario = context.read<RutinaProvider>().usuario;
        if (rutinaUsuario == null) {
          // Si aún no hay rutina cargada, muestra un loader o return
          return const Center(child: CircularProgressIndicator());
        }

        List<DiaRutina> diaRutina = rutinaUsuario.dias;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<RutinaDiaProvider>().setRutinaDia(diaRutina);
        });
        Map<String, Map<String, List<Map<String, List<EjercicioRutina>>>>> e =
            {};

        for (var dia in diaRutina) {
          final String tipo = dia.detalle.grupo ?? 'General';
          final String recomendacion = dia.detalle.recomendacion ?? '';
          final String nombreDia = dia.dia;
          final ejerciciosDelDia = [...dia.detalle.ejercicios];

          // Inicializar mapa anidado si no existe
          if (!e.containsKey(tipo)) {
            e[tipo] = {};
          }
          if (!e[tipo]!.containsKey(recomendacion)) {
            e[tipo]![recomendacion] = [];
          }

          e[tipo]![recomendacion]!.add({nombreDia: ejerciciosDelDia});
        }

        //String recomendacion = context.read<RutinaProvider>().usuario!.dias.;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Text('$msj', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            //...diaRutina.map((e) => TarjetaEjercicio(ejercicio: e)),
            ...e.entries.expand((tipoEntry) {
              final tipo = tipoEntry.key;
              final recomendaciones = tipoEntry.value;

              return recomendaciones.entries.expand((recoEntry) {
                final recomendacion = recoEntry.key;
                final dias = recoEntry.value;

                return dias.map((diaMap) {
                  final dia = diaMap.keys.first; // Ej: "Día 1"
                  final ejercicios = diaMap[dia]!;

                  final int indiceDiaHoy = DateTime.now().weekday; // 1 = lunes
                  final String diaEsperado = 'Día $indiceDiaHoy';

                  if (dia != diaEsperado) return const SizedBox();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$recomendacion',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (tipo == 'Descanso')
                        const Text(
                          '¡Hoy es día de descanso! Relájate y recarga energías. Recuerda que el descanso es clave para el crecimiento muscular y la recuperación.',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                          ),
                        )
                      else
                        ...ejercicios
                            .map(
                              (ej) => TarjetaEjercicio(
                                ejercicio: ej,
                                recomendacion: tipo,
                              ),
                            )
                            .toList(),
                    ],
                  );
                });
              });
            }).toList(),

            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText:
                    'Notas del día, anotaciones o comentarios o porque no hacer estiramientos',
                hintText:
                    'Escribe aquí tus observaciones del entrenamiento o cualquier detalle importante',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            // ElevatedButton.icon(
            //   onPressed: () {
            //     // Aquí podrías guardar el entrenamiento
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Entrenamiento guardado ✅')),
            //     );
            //   },
            //   icon: const Icon(Icons.check_circle),
            //   label: const Text('Finalizar Entrenamiento'),
            // ),
          ],
        );
      } else {
        msj = 'No tienes una rutina asignada. Por favor, selecciona una.';
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                msj,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Icon(
                Icons.fitness_center_outlined,
                size: 120,
                color: Colors.grey,
              ),
              // Puedes agregar aquí un botón o widget para seleccionar rutina
            ],
          ),
        );
      }
    }
  }
}

// class Ejercicio {
//   String? sesionID;
//   String? ejercicioId;
//   int? setNumber;
//   List<double>? peso;
//   String nombre;
//   int series;
//   List<int> repeticiones;
//   bool completado;

//   Ejercicio({
//     this.sesionID,
//     this.ejercicioId,
//     this.setNumber,
//     required this.nombre,
//     required this.series,
//     required this.repeticiones,
//     this.peso,
//     this.completado = false,
//   });
// }
