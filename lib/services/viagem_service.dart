import 'package:caronapp/store/car_model.dart';
import 'package:caronapp/store/marcas_model.dart';
import 'package:caronapp/store/status_viagem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ViagemService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance
      .refFromURL("https://vemjunto-f9f4d-default-rtdb.firebaseio.com/");
  late final DatabaseReference _tripRef = _rootRef.child('trips');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> saveTrip(
      {required String data,
      required String horario,
      required String partida,
      required String chegada,
      required Car? carro,
      required StatusViagem status}) async {
    String? tripId;
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

    tripId = newTripRef.key;

    return tripId;
  }

  Future<List<dynamic>> getTripsByUser() async {
    try {
      final User? currentUser = _auth.currentUser;

      final String motoristaKey = currentUser?.uid ?? '';

      final DatabaseEvent snapshot =
          await _tripRef.orderByChild('motorista').equalTo(motoristaKey).once();

      final Map<dynamic, dynamic>? tripData =
          (snapshot.snapshot.value as Map<dynamic, dynamic>?);
      final List<dynamic> trips = tripData?.values.toList() ?? [];

      return trips;
    } catch (e) {
      // Handle the data reading error here
      print('Error retrieving user trips: $e');
      return [];
    }
  }

  Future<void> setStatusViagem(String viagemId, StatusViagem novoStatus) async {
    final DatabaseReference viagemRef = _tripRef.child(viagemId);

    await viagemRef.update({'status': novoStatus.toString()});
  }
}
