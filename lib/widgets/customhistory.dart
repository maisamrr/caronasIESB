import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHistory extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String subtitle;

  const CustomHistory({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //ICONE CARONA
          Container(
            margin: const EdgeInsets.only(right: 24.0),
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 40,
            height: 40,
            child: SvgPicture.asset(
              "assets/images/carona_icon.svg",
              width: 30,
              height: 30,
            ),
          ),
          //FIM ICONE CARONA
          //TEXTOS
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
          //FIM TEXTOS
          //SETA
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(Icons.chevron_right, size: 40),
              ],
            ),
            //FIM SETA
          ),
        ],
      ),
    );
  }
}
