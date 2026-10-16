import 'package:flutter/material.dart';

import 'casos/adapter.dart';
import 'casos/dependency_injection.dart';
import 'casos/factory.dart';
import 'casos/observer.dart';
import 'casos/repository.dart';
import 'casos/strategy.dart';

void main() {
  final almacen = ConsumoEnMemoria();
  final lector = LectorMedidor(MedidorLegado());
  runApp(EcoTrackApp(almacen: almacen, lector: lector));
}

class EcoTrackApp extends StatelessWidget {
  const EcoTrackApp({
    super.key,
    required this.almacen,
    required this.lector,
  });

  final AlmacenConsumo almacen;
  final LectorMedidor lector;

  @override
  Widget build(BuildContext context) {
    // Cada caso: patrón, problema que resuelve y pantalla que lo muestra.
    final casos = <(String, String, Widget)>[
      (
        'Repository',
        'Ocultar de dónde salen los datos.',
        PantallaConsumo(almacen: almacen),
      ),
      (
        'Adapter',
        'Traducir un formato ajeno al de la app.',
        PantallaMedidor(lector: lector),
      ),
      (
        'Factory',
        'Centralizar la construcción de un objeto según el caso.',
        const PantallaAviso(),
      ),
      (
        'Strategy',
        'Intercambiar una regla sin copiar if.',
        const PantallaTope(),
      ),
      (
        'Observer',
        'Avisar a varios interesados sin nombrarlos.',
        const PantallaPaneles(),
      ),
      (
        'Inyección de dependencias',
        'Entregar desde fuera el objeto del que se depende.',
        const PantallaLab(),
      ),
    ];

    return MaterialApp(
      title: 'EcoTrack',
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('EcoTrack')),
          body: ListView(
            children: [
              for (final (i, (nombre, problema, pagina)) in casos.indexed)
                ListTile(
                  leading: CircleAvatar(child: Text('${i + 1}')),
                  title: Text(nombre),
                  subtitle: Text(problema),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => pagina),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
