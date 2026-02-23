import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/lote_provider.dart';
import '../../widgets/agregar_lote_modal.dart';
import 'estadisticas_ponedoras_screen.dart';

class PonedorasListScreen extends StatelessWidget {
  const PonedorasListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ponedoras"),
      ),
      body: Consumer<LoteProvider>(
        builder: (context, provider, child) {
          final lotes = provider.lotesPonedoras;

          if (lotes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.egg,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No hay lotes agregados',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Presiona el + para agregar uno',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: lotes.length,
            itemBuilder: (context, index) {
              final lote = lotes[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              lote.nombre,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Eliminar lote'),
                                  content: Text(
                                    '¿Deseas eliminar ${lote.nombre}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text('Cancelar'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        provider.eliminarLotePonedoras(lote.id);
                                        Navigator.pop(ctx);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text('Eliminar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red[400],
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _InfoRow(
                        icon: Icons.production_quantity_limits,
                        label: 'Cantidad',
                        value: '${lote.cantidad}',
                      ),
                      const SizedBox(height: 4),
                      _InfoRow(
                        icon: Icons.attach_money,
                        label: 'Precio Unit.',
                        value: '\$${lote.precioUnitario.toStringAsFixed(2)}',
                      ),
                      const SizedBox(height: 4),
                      _InfoRow(
                        icon: Icons.calendar_today,
                        label: 'Inicio',
                        value: lote.fechaInicio.toLocal().toString().split(' ')[0],
                      ),
                      const SizedBox(height: 4),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.amber[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Total: \$${(lote.cantidad * lote.precioUnitario).toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
              showDialog(
                context: context,
                builder: (ctx) => const AgregarLoteModal(tipo: 'ponedoras'),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}