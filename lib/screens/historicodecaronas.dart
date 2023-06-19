import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';
import 'atividades.dart';

class HistoricoDeCaronas extends StatelessWidget {
  const HistoricoDeCaronas({super.key});
  /*SavedAddress savedAddress = SavedAddress();*/

  @override
  Widget build(BuildContext context) {
    //List<Address> addresses = savedAddress.savedAddress;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.grey,
                    ),
                    onTap: () => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const Atividades()))
                    },
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Histórico de Caronas',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              /*Container(
                height: 500,
                child: ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return AddressTile(
                      address: address,
                      onPressed: () {},
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
