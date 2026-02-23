import 'tipo_insumo.dart';

class Engorde {
  final int id;
  final String nombre;
  final int cantidad;
  final double precioUnitario;
  final DateTime fechaInicio;
  final TipoInsumo insumos;
  final int estado;

  Engorde({
    required this.id,
    required this.nombre,
    required this.cantidad,
    required this.precioUnitario,
    required this.fechaInicio,
    this.insumos = TipoInsumo.alimento,
    this.estado = 0,
  });

  // Para crear una copia con cambios
  Engorde copyWith({
    int? id,
    String? nombre,
    int? cantidad,
    double? precioUnitario,
    DateTime? fechaInicio,
    TipoInsumo? insumos,
    int? estado,
  }) {
    return Engorde(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      cantidad: cantidad ?? this.cantidad,
      precioUnitario: precioUnitario ?? this.precioUnitario,
      fechaInicio: fechaInicio ?? this.fechaInicio,
      insumos: insumos ?? this.insumos,
      estado: estado ?? this.estado,
    );
  }

  @override
  String toString() => 'Engorde(id: $id, nombre: $nombre, cantidad: $cantidad)';
}
