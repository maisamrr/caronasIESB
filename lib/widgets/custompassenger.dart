import 'package:flutter/material.dart';

class CustomPassenger extends StatelessWidget {
  final String passengerName;
  final String passengerAddress;
  final DateTime passengerHour;
  final Color containerColor;

  const CustomPassenger(
      {super.key,
      required this.passengerName,
      required this.passengerAddress,
      required this.passengerHour,
      required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.only(right: 40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              //FOTO PASSAGEIRO
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(8.0, 0, 16.0, 0),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                      214, 214, 214, 0.612),
                                  borderRadius: BorderRadius.circular(17.5),
                                ),
                                child: const Icon(Icons.account_circle,
                                    color: Colors.grey, size: 25),
                              ),
                              //NOME + ENDERECO
                              Padding(
                                padding: const EdgeInsets.only(right: 32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      passengerName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      passengerAddress,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffB0B0B0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //HORA
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: containerColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Text(
                                      passengerHour.hour.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      ':',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      passengerHour.minute.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        //FIM HORA
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
