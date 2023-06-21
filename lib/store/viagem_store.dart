import 'package:caronapp/store/status_viagem.dart';
import 'package:caronapp/store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'address_store.dart';
import 'car_model.dart';

part 'viagem_store.g.dart';

class ViagemStore = _ViagemStoreBase with _$ViagemStore;

abstract class _ViagemStoreBase with Store {
  //data
  @observable
  String data = '';

  //horario
  @observable
  String horario = '';

  //motorista
  @observable
  UserStore motorista = UserStore();

  //partida
  @observable
  AddressStore partida = AddressStore();

  //chegada
  @observable
  AddressStore chegada = AddressStore();

  //carro
  @observable
  Car? carro;

  //passageiros
  @observable
  ObservableList<UserStore> passageiros = ObservableList<UserStore>();

  @observable
  StatusViagem status = StatusViagem.naoIniciada;

  @action
  void setData(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    data = dateFormat.format(dateTime);
  }

  @action
  void setHorario(DateTime dateTime) {
    DateFormat timeFormat = DateFormat.Hm();
    horario = timeFormat.format(dateTime);
  }

  @action
  void setPartida(String apelido, String rua, String numero) {
    partida.setApelido(apelido);
    partida.setRua(rua);
    partida.setNumero(numero);
  }

  @action
  void setChegada(String apelido, String rua, String numero) {
    chegada.setApelido(apelido);
    chegada.setRua(rua);
    chegada.setNumero(numero);
  }

  @action
  void setMotorista(String nome) {
    motorista.setNome(nome);
  }

  @action
  void setCarro(Car carroSelecionado) {
    carro = carroSelecionado;
  }

  @action
  void addPassageiro(UserStore passageiro) {
    if (passageiros.length < 4) {
      passageiros.add(passageiro);
    }
  }

  @action
  void removePassageiro(UserStore passageiro) {
    passageiros.remove(passageiro);
  }

  @computed
  bool get temCarro => carro != null;

  int calculateStatus() {
    if (status == StatusViagem.naoIniciada) {
      return 0;
    } else if (status == StatusViagem.emCurso) {
      return 1;
    } else if (status == StatusViagem.finalizada) {
      return 2;
    } else if (status == StatusViagem.cancelada) {
      return 3;
    }
    return 0;
  }

  @action
  void iniciarViagem() {
    status = StatusViagem.emCurso;
  }

  @action
  void finalizarViagem() {
    status = StatusViagem.finalizada;
  }

  @action
  void cancelarViagem() {
    status = StatusViagem.cancelada;
  }
}
