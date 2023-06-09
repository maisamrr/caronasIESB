// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarStore on CarStoreBase, Store {
  late final _$carrosAtom = Atom(name: 'CarStoreBase.carros', context: context);

  @override
  ObservableList<Car> get carros {
    _$carrosAtom.reportRead();
    return super.carros;
  }

  @override
  set carros(ObservableList<Car> value) {
    _$carrosAtom.reportWrite(value, super.carros, () {
      super.carros = value;
    });
  }

  late final _$CarStoreBaseActionController =
      ActionController(name: 'CarStoreBase', context: context);

  @override
  dynamic addCar(Car carro) {
    final _$actionInfo =
        _$CarStoreBaseActionController.startAction(name: 'CarStoreBase.addCar');
    try {
      return super.addCar(carro);
    } finally {
      _$CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeCar(Car carro) {
    final _$actionInfo = _$CarStoreBaseActionController.startAction(
        name: 'CarStoreBase.removeCar');
    try {
      return super.removeCar(carro);
    } finally {
      _$CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carros: ${carros}
    ''';
  }
}
