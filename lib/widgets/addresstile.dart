import 'package:caronapp/models/address.dart';
import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final Address address;
  final Icon iconAsset;
  void Function()? onPressed;

  AddressTile({
    super.key,
    required this.address,
    this.iconAsset = const Icon(Icons.hail_outlined, size: 30),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFf7f5f5),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                address.nameAddress,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
              ),
            ),
            subtitle: Text(address.detailsAddress),
            leading: iconAsset,
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
