import 'dart:math';

import 'package:caronapp/store/address_store.dart';
import 'package:caronapp/store/car_model.dart';
import 'package:caronapp/store/status_viagem.dart';
import 'package:caronapp/store/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

class ViagemService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance
      .refFromURL("https://vemjunto-f9f4d-default-rtdb.firebaseio.com/");
  late final DatabaseReference _tripRef = _rootRef.child('trips');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveTrip(
      {required String data,
      required String horario,
      required AddressStore partida,
      required AddressStore chegada,
      required Car? carro,
      required StatusViagem status}) async {
    final User? currentUser = _auth.currentUser;

    final String motoristaKey = currentUser?.uid ?? '';

    final Map<String, dynamic> viagemData = {
      'data': data,
      'horario': horario,
      'motorista':
          motoristaKey, // Usar a chave única do motorista como referência
      'partida': {
        'apelido': partida.apelido,
        'rua': partida.rua,
        'numero': partida.numero,
      },
      'chegada': {
        'apelido': chegada.apelido,
        'rua': chegada.rua,
        'numero': chegada.numero,
      },
      'car': {
        'placa': carro?.placa,
        'marca': carro?.marca,
      },
      'status': status.toString(),
    };

    // Criar um novo nó para o usuário
    final newTripRef = _tripRef.push();

    // Definir os dados do usuário
    await newTripRef.set({viagemData});
  }
}
