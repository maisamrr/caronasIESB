import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 40.0),
      child: SizedBox(
        width: 120,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
            backgroundColor: const Color(0xFF1AD5AD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              const Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
