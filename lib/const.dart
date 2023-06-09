import 'package:caronapp/store/address_store.dart';
import 'package:flutter/material.dart';

//background color
var backgroundColor = const Color(0xFFE4E3E3);

//id colors
var redIdColor = const Color(0xFFFF5757);
var greenIdColor = const Color(0xFF1AD5AD);

//teste
List<AddressStore> addresses = [
  AddressStore()
    ..setApelido('IESB')
    ..setRua('SGAS Quadra 613/614')
    ..setNumero(''),
  AddressStore()
    ..setApelido('Casa')
    ..setRua('SQS 123 Bloco A')
    ..setNumero(''),
  AddressStore()
    ..setApelido('Shopping')
    ..setRua('SDN, CNB - Asa Norte')
    ..setNumero(''),
];
