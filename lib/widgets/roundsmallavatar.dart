import 'package:flutter/material.dart';

class RoundSmallAvatar extends StatelessWidget {
  final String photoPath;

  RoundSmallAvatar({required this.photoPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(214, 214, 214, 0.612),
        borderRadius: BorderRadius.circular(17.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17.5),
        child: Image.asset(
          photoPath,
          width: 35,
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
