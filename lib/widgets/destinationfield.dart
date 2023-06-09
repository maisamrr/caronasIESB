import 'package:flutter/material.dart';

class DestinationField extends StatelessWidget {
  final IconData icon;
  final TextEditingController textEditingController;

  const DestinationField({
    Key? key,
    required this.icon,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    icon,
                    size: 22,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: null,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8, 1, 1, 1),
                  child: const Icon(
                    Icons.close,
                    size: 22,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
