import 'package:flutter/material.dart';

import '../store/address_store.dart';

class AddressTile extends StatefulWidget {
  final String? local;
  final String? hora;
  final String? data;

  final Icon iconAsset;

  const AddressTile({
    Key? key,
    required this.local,
    required this.hora,
    required this.data,
    this.iconAsset = const Icon(Icons.hail_outlined, size: 30),
  }) : super(key: key);

  @override
  State<AddressTile> createState() => _AddressTileState();
}

class _AddressTileState extends State<AddressTile> {
  final _form = GlobalKey<FormState>();
  final addressStore = AddressStore();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFf7f5f5),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  widget.local ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              subtitle: Text("${widget.data ?? ""} - ${widget.hora ?? ""}"),
              leading: widget.iconAsset,
            ),
          ),
        ),
      ),
    );
  }
}
