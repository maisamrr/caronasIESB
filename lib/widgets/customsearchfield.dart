import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Function(String)? onSubmitted;

  const CustomSearchField({
    Key? key,
    required this.labelText,
    required this.keyboardType,
    required this.backgroundColor,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 8.0),
              child: Icon(
                Icons.search,
                size: 22,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: TextField(
                controller: null,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: InputBorder.none,
                ),
                onSubmitted: onSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
