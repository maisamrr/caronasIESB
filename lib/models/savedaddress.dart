import 'address.dart';
import 'package:flutter/material.dart';

class SavedAddress {
  final List<Address> _savedAdress = [
    Address(
      nameAddress: 'Casa',
      detailsAddress: 'QE 38, Guará',
    ),
    Address(
      nameAddress: 'IESB Sul',
      detailsAddress: 'SGAS Quadra 613/614',
    ),
  ];

  //get saved addresses
  List<Address> get savedAddress => _savedAdress;

  //add new address to the list
  void addAddressToList(Address newAddress) {
    _savedAdress.add(newAddress);
  }

  //remove an address from the list
  void removeAddressFromList(Address removeAddress) {
    _savedAdress.remove(removeAddress);
  }
}
