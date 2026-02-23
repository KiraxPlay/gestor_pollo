
import 'package:flutter/material.dart';
import 'engorde/engorde_list_screen.dart';
import 'ponedoras/ponedoras_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestión Pollos")),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        padding: const EdgeInsets.all(16),
        children: [
          _buildModuleCard(
            context,
            title: "Engorde",
            icon: Icons.agriculture,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EngordeListScreen()),
              );
            },
          ),
          _buildModuleCard(
            context,
            title: "Ponedoras",
            icon: Icons.egg,
            onTap: () {
               Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PonedorasListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
