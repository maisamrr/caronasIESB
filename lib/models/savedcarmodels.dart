import 'package:caronapp/models/carmodel.dart';
import 'package:flutter/material.dart';

class SavedCarModels {
  final List<CarModel> _savedCarModel = [
    CarModel(
      carName: 'Hyundai HB20',
      carPlate: 'BRA1234',
    ),
    CarModel(
      carName: 'Ford Ka',
      carPlate: 'ABC1B34',
    ),
  ];

  List<CarModel> get savedCarModels => _savedCarModel;

  void addCarModelToList(CarModel newCarModel) {
    _savedCarModel.add(newCarModel);
  }

  void removeCarFromList(CarModel removeCarModel) {
    _savedCarModel.remove(removeCarModel);
  }
}
