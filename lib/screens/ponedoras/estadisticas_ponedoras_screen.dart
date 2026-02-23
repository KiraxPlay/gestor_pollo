import 'package:flutter/material.dart';

class EstadisticasPonedorasScreen extends StatelessWidget {
  const EstadisticasPonedorasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estadísticas Ponedoras"),
      ),
      body: const Center(
        child: Text(
          "Pantalla en construcion 📊",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}