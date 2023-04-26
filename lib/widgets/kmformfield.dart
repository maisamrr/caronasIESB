import 'package:flutter/material.dart';

class KmFormField extends StatefulWidget {
  final String label;

  KmFormField({
    required this.label,
  });

  @override
  _KmFormFieldState createState() => _KmFormFieldState();
}

class _KmFormFieldState extends State<KmFormField> {
  int? _km;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xFFEDEDED),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: const Color(0xFFFF5757),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration.collapsed(hintText: '0.0km'),
                      validator: (km) {
                        if (km == null || km.isEmpty) {
                          return 'Digite o limite de quilometragem, de 1 a 10';
                        }
                        final number = int.tryParse(km);
                        if (number == null || number < 1 || number > 10) {
                          return 'Número inválido';
                        }
                        return null;
                      },
                      onChanged: (km) {
                        setState(() {
                          _km = int.tryParse(km);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
