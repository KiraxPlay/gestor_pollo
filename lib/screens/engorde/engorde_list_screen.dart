
import 'package:flutter/material.dart';

class EngordeListScreen extends StatelessWidget {
  const EngordeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lotes Engorde")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: 0,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: const Center(
              child: Text("Lote"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No funcional")),
          );
        },
        tooltip: "Agregar lote",
        child: const Icon(Icons.add),
      ),
    );
  }
}
