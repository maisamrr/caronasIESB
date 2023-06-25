import 'dart:math';

import 'package:caronapp/store/address_store.dart';
import 'package:caronapp/store/car_model.dart';
import 'package:caronapp/store/marcas_model.dart';
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
      required String partida,
      required String chegada,
      required Car? carro,
      required StatusViagem status}) async {
    final User? currentUser = _auth.currentUser;

    final String motoristaKey = currentUser?.uid ?? '';

    // Criar um novo nó para o usuário
    final newTripRef = _tripRef.push();

    // Definir os dados do usuário
    await newTripRef.set({
      'data': data,
      'horario': horario,
      'motorista':
          motoristaKey, // Usar a chave única do motorista como referência
      'partida': partida,
      'chegada': chegada,
      'car': {
        "placa": carro?.placa.toString(),
        "marca": carro?.marca.formattedString,
      },
      'status': status.toString(),
    });
  }
}
