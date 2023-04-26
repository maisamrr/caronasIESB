import 'package:flutter/material.dart';

class CustomPassenger extends StatelessWidget {
  final String passengerName;
  final String passengerAddress;
  final DateTime passengerHour;
  final IconData icon;
  final String iconText;
  final Color containerColor;

  const CustomPassenger(
      {super.key,
      required this.passengerName,
      required this.passengerAddress,
      required this.passengerHour,
      required this.icon,
      required this.iconText,
      required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //color: Colors.blue,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 80.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xffececec),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          //FOTO PASSAGEIRO
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
                          //FIM FOTO PASSAGEIRO
                          Row(
                            children: [
                              //NOME + ENDERECO
                              Padding(
                                padding: const EdgeInsets.only(right: 32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              //FIM NOME + ENDERECO
                              //HORA
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
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
                            ],
                          ),
                          //FIM HORA
                        ],
                      ),
                    ),
                  ),
                ),

                //CANCELAR
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(icon, color: Colors.grey, size: 25),
                      Text(
                        iconText,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
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
