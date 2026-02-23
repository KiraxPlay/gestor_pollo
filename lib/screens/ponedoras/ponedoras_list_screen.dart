import 'package:flutter/material.dart';
import 'estadisticas_ponedoras_screen.dart';

class PonedorasListScreen extends StatelessWidget {
  const PonedorasListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ponedoras"),
      ),
      body: const Center(
        child: Text("Lista de ponedoras"),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "estadisticas",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EstadisticasPonedorasScreen(),
                ),
              );
            },
            child: const Icon(Icons.bar_chart),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: "agregar",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No funcional"),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}