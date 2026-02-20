
import 'package:flutter/material.dart';

class LoteProvider with ChangeNotifier {
  List<String> _lotes = [];

  List<String> get lotes => _lotes;

  void agregarLote(String lote) {
    _lotes.add(lote);
    notifyListeners();
  }
}
