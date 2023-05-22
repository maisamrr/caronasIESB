import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> optionsList;
  final String hint;
  final Color boxColor; // New parameter for box color

  CustomDropdown({required this.optionsList, required this.hint, required this.boxColor});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: widget.boxColor, // Use the boxColor parameter here
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: DropdownButton<String>(
            value: selectedOption,
            hint: Text(widget.hint),
            isExpanded: true,
            items: widget.optionsList.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
            underline: Container(),
          ),
        ),
      ),
    );
  }
}
