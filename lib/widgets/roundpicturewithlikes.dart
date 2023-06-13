import 'package:caronapp/widgets/roundprofilepicture.dart';
import 'package:flutter/material.dart';

class RoundProfilePictureWithLikes extends StatelessWidget {
  final String photoPath;
  final double size;
  final int thumbsUpCount;

  const RoundProfilePictureWithLikes({super.key, 
    required this.photoPath,
    required this.size,
    required this.thumbsUpCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundProfilePicture(
          photoPath: photoPath,
          circleSize: size,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFF5757),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  thumbsUpCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
