import 'package:caronapp/models/carmodel.dart';
import 'package:flutter/material.dart';

class CarModelTile extends StatelessWidget {
  final CarModel carModel;
  final Icon iconAsset;
  void Function()? onPressed;

  CarModelTile({
    super.key,
    required this.carModel,
    this.iconAsset = const Icon(Icons.directions_car_outlined, size: 30),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                carModel.carName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: Text(carModel.carPlate),
            leading: iconAsset,
            trailing: IconButton(
              icon: const Icon(
                Icons.delete_outline,
                size: 25,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
