import 'package:caronapp/widgets/roundprofilepicture.dart';
import 'package:flutter/material.dart';

class RoundProfilePictureWithLikes extends StatelessWidget {
  final String photoPath;
  final double size;
  final int thumbsUpCount;

  RoundProfilePictureWithLikes({
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
          size: size,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFF5757),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(4),
            child: Row(
              children: [
                Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  thumbsUpCount.toString(),
                  style: TextStyle(
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
