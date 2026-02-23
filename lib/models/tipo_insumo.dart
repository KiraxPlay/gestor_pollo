enum TipoInsumo {
  alimento,
  medicamento,
  vacuna,
  vitamina,
  desinfectante,
  otro,
}

extension TipoInsumoExtension on TipoInsumo {
  String get nombre {
    return switch (this) {
      TipoInsumo.alimento => 'Alimento',
      TipoInsumo.medicamento => 'Medicamento',
      TipoInsumo.vacuna => 'Vacuna',
      TipoInsumo.vitamina => 'Vitamina',
      TipoInsumo.desinfectante => 'Desinfectante',
      TipoInsumo.otro => 'Otro',
    };
  }
}
