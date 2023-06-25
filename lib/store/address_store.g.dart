// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressStore on _AddressStoreBase, Store {
  Computed<String>? _$getApelidoComputed;

  @override
  String get getApelido =>
      (_$getApelidoComputed ??= Computed<String>(() => super.getApelido,
              name: '_AddressStoreBase.getApelido'))
          .value;
  Computed<String>? _$getRuaComputed;

  @override
  String get getRua =>
      (_$getRuaComputed ??= Computed<String>(() => super.getRua,
              name: '_AddressStoreBase.getRua'))
          .value;
  Computed<String>? _$getNumeroComputed;

  @override
  String get getNumero =>
      (_$getNumeroComputed ??= Computed<String>(() => super.getNumero,
              name: '_AddressStoreBase.getNumero'))
          .value;

  late final _$apelidoAtom =
      Atom(name: '_AddressStoreBase.apelido', context: context);

  @override
  String get address {
    _$apelidoAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$apelidoAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$ruaAtom = Atom(name: '_AddressStoreBase.rua', context: context);

  @override
  String get rua {
    _$ruaAtom.reportRead();
    return super.rua;
  }

  @override
  set rua(String value) {
    _$ruaAtom.reportWrite(value, super.rua, () {
      super.rua = value;
    });
  }

  late final _$numeroAtom =
      Atom(name: '_AddressStoreBase.numero', context: context);

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  late final _$_AddressStoreBaseActionController =
      ActionController(name: '_AddressStoreBase', context: context);

  @override
  void setApelido(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setApelido');
    try {
      return super.setApelido(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRua(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setRua');
    try {
      return super.setRua(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumero(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setNumero');
    try {
      return super.setNumero(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
apelido: ${address},
rua: ${rua},
numero: ${numero},
getApelido: ${getApelido},
getRua: ${getRua},
getNumero: ${getNumero}
    ''';
  }
}
