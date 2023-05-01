import 'package:caronapp/screens/homecarona.dart';
import 'package:flutter/material.dart';
import '../widgets/addcarbutton.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/custombutton.dart';
import '../widgets/customsearchfield.dart';
import '../widgets/customtimepicker.dart';
import '../widgets/kmformfield.dart';

class OferecerCarona extends StatefulWidget {
  const OferecerCarona({Key? key}) : super(key: key);

  @override
  _OferecerCaronaState createState() => _OferecerCaronaState();
}

class _OferecerCaronaState extends State<OferecerCarona> {
  TimeOfDay? _selectedTime;
  int _km = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: Text(
                  'Oferecer Carona',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5757),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text('Carro em uso',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inria',
                        color: Colors.black))),
            Padding(
                padding: EdgeInsets.fromLTRB(40, 24, 0, 0),
                child: AddCarButton()),
            CustomSearchField(
              labelText: 'Local de partida',
              keyboardType: TextInputType.text,
              backgroundColor: const Color(0xFFEDEDED),
              onSubmitted: (value) {},
            ),
            CustomSearchField(
              labelText: 'Destino final',
              keyboardType: TextInputType.text,
              backgroundColor: const Color(0xFFEDEDED),
              onSubmitted: (value) {},
            ),
            CustomTimePicker(
              labelText: 'Horário de saída',
              initialValue: _selectedTime,
              onSaved: (time) {
                _selectedTime = time;
              },
              validator: (time) {
                if (time == null) {
                  return 'É necessário selecionar um horário';
                }
                return null;
              },
              context: context,
              backgroundColor: const Color(0xFFEDEDED),
              keyboardType: TextInputType.text, // pass context here
            ),
            KmFormField(
              context: context,
              labelText: 'Enter a number',
              keyboardType: TextInputType.number,
              backgroundColor: Colors.grey[200]!,
              onSubmitted: (value) {},
            ),
            Padding(
                padding: EdgeInsets.only(left: 40, top: 7),
                child: CustomButton(
                    text: 'VemJunto',
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeCarona()));
                    }))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
