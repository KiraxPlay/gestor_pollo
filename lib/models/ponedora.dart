import 'tipo_insumo.dart';

class Ponedora {
  final int id;
  final String nombre;
  final int cantidad;
  final double precioUnitario;
  final DateTime fechaInicio;
  final int huevosPuestos;
  final TipoInsumo insumos;
  final int estado;

  Ponedora({
    required this.id,
    required this.nombre,
    required this.cantidad,
    required this.precioUnitario,
    required this.fechaInicio,
    this.huevosPuestos = 0,
    this.insumos = TipoInsumo.alimento,
    this.estado = 0,
  });

  // Para crear una copia con cambios
  Ponedora copyWith({
    int? id,
    String? nombre,
    int? cantidad,
    double? precioUnitario,
    DateTime? fechaInicio,
    int? huevosPuestos,
    TipoInsumo? insumos,
    int? estado,
  }) {
    return Ponedora(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      cantidad: cantidad ?? this.cantidad,
      precioUnitario: precioUnitario ?? this.precioUnitario,
      fechaInicio: fechaInicio ?? this.fechaInicio,
      huevosPuestos: huevosPuestos ?? this.huevosPuestos,
      insumos: insumos ?? this.insumos,
      estado: estado ?? this.estado,
    );
  }

  @override
  String toString() => 'Ponedora(id: $id, nombre: $nombre, cantidad: $cantidad)';
}
