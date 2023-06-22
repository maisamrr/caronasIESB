import 'package:caronapp/store/marcas_model.dart';

class Car {
  String _placa;
  Marca _marca;

  Car({required String placa, required Marca marca})
      : _placa = placa,
        _marca = marca;

  String get placa => _placa;

  get name => null;

  set placa(String value) {
    _placa = value;
  }

  Marca get marca => _marca;

  set marca(Marca value) {
    _marca = value;
  }
}
