import 'package:flutter/material.dart';

void main() {
  runApp(const VasosApp());
}

/// Raíz de la app: configura el título, el tema y la pantalla inicial.
class VasosApp extends StatelessWidget {
  const VasosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vasos de agua',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const PantallaVasos(titulo: 'Vasos de agua diarios de Pablo'),
    );
  }
}

/// Pantalla principal: cuenta los vasos de agua que bebes en el día.
class PantallaVasos extends StatefulWidget {
  const PantallaVasos({super.key, required this.titulo});
  final String titulo;

  @override
  State<PantallaVasos> createState() => _PantallaVasosState();
}

class _PantallaVasosState extends State<PantallaVasos> {
  int _vasos = 0;

  void _anadirVaso() {
    setState(() {
      _vasos++;
    });
  }

  void _quitarVaso() {
    if (_vasos > 0) {
      setState(() {
        _vasos--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Vasos de agua que llevas hoy:'),
            Text(
              '$_vasos',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_vasos >= 8) const Text('Objetivo cumplido'),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'quitar',
            onPressed: _quitarVaso,
            tooltip: 'Quitar vaso',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'anadir',
            onPressed: _anadirVaso,
            tooltip: 'Añadir vaso',
            child: const Icon(Icons.local_drink),
          ),
        ],
      ),
    );
  }
}
