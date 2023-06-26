import 'package:caronapp/store/car_model.dart';
import 'package:caronapp/store/marcas_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/car_store.dart';

class CarModelTile extends StatelessWidget {
  final Car carro;
  final VoidCallback onTap;

  const CarModelTile({super.key, 
    required this.carro,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    CarStore carStore = Provider.of<CarStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFf7f5f5),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                '/oferecercarona',
                arguments: {
                  'selectedPlaca': carro.placa,
                  'selectedMarca': carro.marca,
                },
              );
            }, // Add the onTap callback here
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                carro.marca.formattedString,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: Text(carro.placa),
            leading: const Icon(Icons.directions_car_outlined, size: 30),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete_outline,
                size: 25,
              ),
              onPressed: () {
                carStore.removeCar(carro);
              },
            ),
          ),
        ),
      ),
    );
  }
}
