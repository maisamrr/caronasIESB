import 'package:caronapp/store/marcas_model.dart';
import 'package:flutter/material.dart';

class Car {
  String _placa;
  Marca _marca;

  Car({required String placa, required Marca marca})
      : _placa = placa,
        _marca = marca;

  String get placa => _placa;

  set placa(String value) {
    _placa = value;
  }

  Marca get marca => _marca;

  set marca(Marca value) {
    _marca = value;
  }
}
