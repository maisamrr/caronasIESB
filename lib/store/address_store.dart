import 'package:mobx/mobx.dart';

part 'address_store.g.dart';

class AddressStore = _AddressStoreBase with _$AddressStore;

abstract class _AddressStoreBase with Store {
  @observable
  String apelido = "";

  @observable
  String rua = "";

  @observable
  String numero = "";

  @action
  void setApelido(String value) => apelido = value;

  @action
  void setRua(String value) => rua = value;

  @action
  void setNumero(String value) => numero = value;
  
  @computed
  String get getApelido => apelido;

  @computed
  String get getRua => rua;

  @computed
  String get getNumero => numero;
}
