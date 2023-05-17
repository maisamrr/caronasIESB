import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHistory extends StatelessWidget {
  final String title;
  final String subtitle;
  final dynamic iconAsset;

  const CustomHistory({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    if (iconAsset is String && iconAsset.endsWith('.svg')) {
      iconWidget = SvgPicture.asset(
        iconAsset,
        width: 30,
        height: 30,
      );
    } else if (iconAsset is Icon) {
      iconWidget = iconAsset;
    } else {
      iconWidget = const Icon(
        Icons.add,
        size: 20,
        color: Colors.black,
      );
    }
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ICON
          Container(
            margin: const EdgeInsets.only(right: 24.0),
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 40,
            height: 40,
            child: iconWidget,
          ),
          // END ICON
          // TEXTS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(177, 176, 180, 0.612),
                  ),
                ),
              ],
            ),
          ),
          // END TEXTS
          // ARROW
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(Icons.chevron_right, size: 40),
              ],
            ),
          ),
          // END ARROW
        ],
      ),
    );
  }
}
