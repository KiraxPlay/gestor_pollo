import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/lote_provider.dart';

class AgregarLoteModal extends StatefulWidget {
  final String tipo; // 'engorde' o 'ponedoras'

  const AgregarLoteModal({
    super.key,
    required this.tipo,
  });

  @override
  State<AgregarLoteModal> createState() => _AgregarLoteModalState();
}

class _AgregarLoteModalState extends State<AgregarLoteModal> {
  late TextEditingController _cantidadController;
  late TextEditingController _precioController;
  DateTime _fechaSeleccionada = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _cantidadController = TextEditingController();
    _precioController = TextEditingController();
  }

  @override
  void dispose() {
    _cantidadController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  void _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _fechaSeleccionada) {
      setState(() {
        _fechaSeleccionada = picked;
      });
    }
  }

  void _agregarLote() {
    // Validación
    if (_cantidadController.text.isEmpty || _precioController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor completa todos los campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final cantidad = int.parse(_cantidadController.text);
      final precio = double.parse(_precioController.text);

      if (cantidad <= 0 || precio <= 0) {
        throw Exception('Los valores deben ser positivos');
      }

      setState(() => _isLoading = true);

      final provider = context.read<LoteProvider>();

      if (widget.tipo == 'engorde') {
        provider.agregarLoteEngorde(
          cantidad: cantidad,
          precioUnitario: precio,
          fechaInicio: _fechaSeleccionada,
        );
      } else {
        provider.agregarLotePonedoras(
          cantidad: cantidad,
          precioUnitario: precio,
          fechaInicio: _fechaSeleccionada,
        );
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lote ${widget.tipo} agregado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar Lote - ${widget.tipo.toUpperCase()}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Campo Cantidad
            TextField(
              controller: _cantidadController,
              decoration: InputDecoration(
                labelText: 'Cantidad',
                hintText: 'Ej: 1000',
                prefixIcon: const Icon(Icons.numbers),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Campo Precio Unitario
            TextField(
              controller: _precioController,
              decoration: InputDecoration(
                labelText: 'Precio Unitario',
                hintText: 'Ej: 15.50',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),

          
            const SizedBox(height: 16),

            // Selector de Fecha
            GestureDetector(
              onTap: () => _seleccionarFecha(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fecha de Inicio: ${_fechaSeleccionada.toLocal().toString().split(' ')[0]}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _agregarLote,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Agregar'),
        ),
      ],
    );
  }
}

