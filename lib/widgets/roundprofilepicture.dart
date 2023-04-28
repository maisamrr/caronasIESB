import 'package:flutter/material.dart';

class RoundProfilePicture extends StatelessWidget {
  final String photoPath;
  final double size;

  RoundProfilePicture({required this.photoPath, required this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(photoPath),
      radius: size / 2,
    );
  }
}
