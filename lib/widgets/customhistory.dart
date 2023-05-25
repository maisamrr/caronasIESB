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
        color: Colors.grey,
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFf7f5f5),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Oie',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff000000),
              ),
            ),
          ),
          leading: iconAsset,
          trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
