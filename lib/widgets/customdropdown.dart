import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> optionsList;
  final String hint;
  final Color boxColor;

  CustomDropdown(
      {required this.optionsList, required this.hint, required this.boxColor});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: widget.boxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Align(
            alignment: Alignment.centerLeft,
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
      ),
    );
  }
}

/*DropdownButton<String>(
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
            ),*/
