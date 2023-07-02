import 'package:caronapp/widgets/roundprofilepicture.dart';
import 'package:flutter/material.dart';

class RoundProfilePictureWithLikes extends StatelessWidget {
  final String photoPath;
  final double size;

  const RoundProfilePictureWithLikes({super.key, 
    required this.photoPath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundProfilePicture(
          photoPath: photoPath,
          circleSize: size,
        ),
      ],
    );
  }
}
