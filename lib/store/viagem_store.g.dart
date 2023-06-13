// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viagem_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViagemStore on _ViagemStoreBase, Store {
  Computed<bool>? _$temCarroComputed;

  @override
  bool get temCarro =>
      (_$temCarroComputed ??= Computed<bool>(() => super.temCarro,
              name: '_ViagemStoreBase.temCarro'))
          .value;

  late final _$dataAtom = Atom(name: '_ViagemStoreBase.data', context: context);

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$horarioAtom =
      Atom(name: '_ViagemStoreBase.horario', context: context);

  @override
  String get horario {
    _$horarioAtom.reportRead();
    return super.horario;
  }

  @override
  set horario(String value) {
    _$horarioAtom.reportWrite(value, super.horario, () {
      super.horario = value;
    });
  }

  late final _$partidaAtom =
      Atom(name: '_ViagemStoreBase.partida', context: context);

  @override
  AddressStore get partida {
    _$partidaAtom.reportRead();
    return super.partida;
  }

  @override
  set partida(AddressStore value) {
    _$partidaAtom.reportWrite(value, super.partida, () {
      super.partida = value;
    });
  }

  late final _$chegadaAtom =
      Atom(name: '_ViagemStoreBase.chegada', context: context);

  @override
  AddressStore get chegada {
    _$chegadaAtom.reportRead();
    return super.chegada;
  }

  @override
  set chegada(AddressStore value) {
    _$chegadaAtom.reportWrite(value, super.chegada, () {
      super.chegada = value;
    });
  }

  late final _$motoristaAtom =
      Atom(name: '_ViagemStoreBase.motorista', context: context);

  @override
  UserStore get motorista {
    _$motoristaAtom.reportRead();
    return super.motorista;
  }

  @override
  set motorista(UserStore value) {
    _$motoristaAtom.reportWrite(value, super.motorista, () {
      super.motorista = value;
    });
  }

  late final _$carroAtom =
      Atom(name: '_ViagemStoreBase.carro', context: context);

  @override
  Car? get carro {
    _$carroAtom.reportRead();
    return super.carro;
  }

  @override
  set carro(Car? value) {
    _$carroAtom.reportWrite(value, super.carro, () {
      super.carro = value;
    });
  }

  late final _$passageirosAtom =
      Atom(name: '_ViagemStoreBase.passageiros', context: context);

  @override
  ObservableList<UserStore> get passageiros {
    _$passageirosAtom.reportRead();
    return super.passageiros;
  }

  @override
  set passageiros(ObservableList<UserStore> value) {
    _$passageirosAtom.reportWrite(value, super.passageiros, () {
      super.passageiros = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_ViagemStoreBase.status', context: context);

  @override
  StatusViagem get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(StatusViagem value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_ViagemStoreBaseActionController =
      ActionController(name: '_ViagemStoreBase', context: context);

  @override
  void setData(DateTime dateTime) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.setData');
    try {
      return super.setData(dateTime);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHorario(DateTime dateTime) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.setHorario');
    try {
      return super.setHorario(dateTime);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPartida(String apelido, String rua, String numero) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.setPartida');
    try {
      return super.setPartida(apelido, rua, numero);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChegada(String apelido, String rua, String numero) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.setChegada');
    try {
      return super.setChegada(apelido, rua, numero);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMotorista(String nome) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.setMotorista');
    try {
      return super.setMotorista(nome);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarro(Car carroSelecionado) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.setCarro');
    try {
      return super.setCarro(carroSelecionado);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPassageiro(UserStore passageiro) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.addPassageiro');
    try {
      return super.addPassageiro(passageiro);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePassageiro(UserStore passageiro) {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.removePassageiro');
    try {
      return super.removePassageiro(passageiro);
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void iniciarViagem() {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.iniciarViagem');
    try {
      return super.iniciarViagem();
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finalizarViagem() {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.finalizarViagem');
    try {
      return super.finalizarViagem();
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelarViagem() {
    final _$actionInfo = _$_ViagemStoreBaseActionController.startAction(
        name: '_ViagemStoreBase.cancelarViagem');
    try {
      return super.cancelarViagem();
    } finally {
      _$_ViagemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
horario: ${horario},
partida: ${partida},
chegada: ${chegada},
motorista: ${motorista},
carro: ${carro},
passageiros: ${passageiros},
status: ${status},
temCarro: ${temCarro}
    ''';
  }
}
