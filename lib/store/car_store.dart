import 'package:caronapp/store/car_model.dart';
import 'package:mobx/mobx.dart';

part 'car_store.g.dart';

class CarStore = CarStoreBase with _$CarStore;

abstract class CarStoreBase with Store {
  @observable
  ObservableList<Car> carros = <Car>[].asObservable();

  @action
  addCar(Car carro) => carros.add(carro);

  @action
  removeCar(Car carro) =>
      carros.removeWhere((element) => element.placa == carro.placa);
}