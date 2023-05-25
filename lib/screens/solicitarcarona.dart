import 'package:caronapp/const.dart';
import 'package:caronapp/models/address.dart';
import 'package:caronapp/models/savedaddress.dart';
import 'package:caronapp/widgets/addresstile.dart';
import 'package:flutter/material.dart';
import '../widgets/customfind.dart';

class PedirCarona extends StatefulWidget {
  const PedirCarona({Key? key});
  @override
  State<PedirCarona> createState() => _PedirCaronaState();
}

class _PedirCaronaState extends State<PedirCarona> {
  SavedAddress savedAddress = SavedAddress();

  @override
  Widget build(BuildContext context) {
    List<Address> addresses = savedAddress.savedAddress;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: Text(
                  'Olá, Julia',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: redIdColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: CustomFind(
                onPressed: () {
                  Navigator.of(context).pushNamed('/destino');
                },
              ),
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 24.0, left: 56.0, right: 40.0, bottom: 24.0),
                  child: Text(
                    'Endereços recentes',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return AddressTile(
                    address: address,
                    onPressed:
                        () {}, //aqui deve autopreencher o endereço de qual seu destino
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
