import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CarService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance
      .refFromURL("https://vemjunto-f9f4d-default-rtdb.firebaseio.com/");
  late final DatabaseReference _carRef = _rootRef.child('car');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> saveCar(
      {required String placa, required String marca}) async {
    String? carId;
    final User? currentUser = _auth.currentUser;

    final String motoristaKey = currentUser?.uid ?? '';

    final newCarRef = _carRef.push();

    await newCarRef.set({
      'placa': placa,
      'marca': marca,
      'motorista': motoristaKey,
    });

    carId = newCarRef.key;

    return carId;
  }

  Future<List<dynamic>> getCarsByUser() async {
    try {
      final User? currentUser = _auth.currentUser;

      final String motoristaKey = currentUser?.uid ?? '';

      final DatabaseEvent snapshot =
          await _carRef.orderByChild('motorista').equalTo(motoristaKey).once();

      final Map<dynamic, dynamic>? carData =
          (snapshot.snapshot.value as Map<dynamic, dynamic>?);
      final List<dynamic> cars = carData?.values.toList() ?? [];

      return cars;
    } catch (e) {
      // Handle the data reading error here
      print('Error retrieving user trips: $e');
      return [];
    }
  }

  Future<void> removeCarByPlaca(String placa) async {
    try {
      final User? currentUser = _auth.currentUser;
      final String motoristaKey = currentUser?.uid ?? '';

      final DatabaseEvent snapshot =
          await _carRef.orderByChild('motorista').equalTo(motoristaKey).once();

      final Map<dynamic, dynamic>? carData =
          (snapshot.snapshot.value as Map<dynamic, dynamic>?);

      // Procurar o carro pelo campo 'placa'
      String? carId;
      carData?.forEach((key, value) {
        if (value['placa'] == placa) {
          carId = key;
        }
      });

      if (carId != null) {
        // Remover o carro encontrado pelo ID
        await _carRef.child(carId!).remove();
      }
    } catch (e) {
      // Lidar com erros durante a remoção do carro
      print('Error removing car: $e');
    }
  }
}
