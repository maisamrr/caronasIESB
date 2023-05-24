import 'package:caronapp/widgets/roundsmallavatar.dart';
import 'package:flutter/material.dart';

class CustomPersonSimple extends StatelessWidget {
  final String personName;

  const CustomPersonSimple({
    super.key,
    required this.personName,
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
              RoundSmallAvatar(photoPath: 'assets/images/imgrandom.png'),

              //MOTORISTA
              Expanded(
                child: Text(
                  personName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
