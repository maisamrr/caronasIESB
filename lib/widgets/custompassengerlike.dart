import 'package:flutter/material.dart';

class CustomPassengerLike extends StatelessWidget {
  final String passengerLikeName;

  const CustomPassengerLike({
    super.key,
    required this.passengerLikeName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 48.0, right: 48.0),
          child: Row(
            children: [
              //FOTO MOTORISTA
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(214, 214, 214, 0.612),
                  borderRadius: BorderRadius.circular(17.5),
                ),
                child: const Icon(Icons.account_circle,
                    color: Colors.grey, size: 25),
              ),

              //MOTORISTA
              Expanded(
                child: Text(
                  passengerLikeName,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
