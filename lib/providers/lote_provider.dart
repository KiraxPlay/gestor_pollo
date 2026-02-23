
import 'package:flutter/material.dart';
import '../models/engorde.dart';
import '../models/ponedora.dart';

class LoteProvider with ChangeNotifier {
  List<Engorde> _lotesEngorde = [];
  List<Ponedora> _lotesPonedoras = [];

  List<Engorde> get lotesEngorde => _lotesEngorde;
  List<Ponedora> get lotesPonedoras => _lotesPonedoras;

  // Agregar lote de engorde
  void agregarLoteEngorde({
    required int cantidad,
    required double precioUnitario,
    required DateTime fechaInicio,
  }) {
    final id = _lotesEngorde.length + 1;
    final nombre = 'Lote $id';

    final nuevoLote = Engorde(
      id: id,
      nombre: nombre,
      cantidad: cantidad,
      precioUnitario: precioUnitario,
      fechaInicio: fechaInicio,
    );

    _lotesEngorde.add(nuevoLote);
    notifyListeners();
  }

  // Agregar lote de ponedoras
  void agregarLotePonedoras({
    required int cantidad,
    required double precioUnitario,
    required DateTime fechaInicio
  }) {
    final id = _lotesPonedoras.length + 1;
    final nombre = 'Ponedoras $id';

    final nuevoLote = Ponedora(
      id: id,
      nombre: nombre,
      cantidad: cantidad,
      precioUnitario: precioUnitario,
      fechaInicio: fechaInicio,
     
    );

    _lotesPonedoras.add(nuevoLote);
    notifyListeners();
  }

  // Eliminar lote de engorde
  void eliminarLoteEngorde(int id) {
    _lotesEngorde.removeWhere((lote) => lote.id == id);
    notifyListeners();
  }

  // Eliminar lote de ponedoras
  void eliminarLotePonedoras(int id) {
    _lotesPonedoras.removeWhere((lote) => lote.id == id);
    notifyListeners();
  }
}
