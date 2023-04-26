import 'package:flutter/material.dart';

class CustomDriver extends StatelessWidget {
  final String driverName;

  const CustomDriver({
    super.key,
    required this.driverName,
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
                child: const Icon(
                  Icons.account_circle,
                  color: Colors.grey, 
                  size: 25
                ),
              ),

              //MOTORISTA
              Expanded(
                child: Text(
                  driverName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //COMPARTILHAR
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.emergency_share,
                      color: Color(0xFFFF5757), 
                      size: 30
                    ),
                    Text(
                      'Compartilhar',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
