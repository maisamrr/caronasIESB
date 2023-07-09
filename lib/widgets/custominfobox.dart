import 'package:flutter/material.dart';

class CustomInfoBox extends StatelessWidget {
  final String boldText;
  final String lightText;
  final IconData iconData;

  const CustomInfoBox({
    Key? key,
    required this.boldText,
    required this.lightText,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            children: [
              Icon(iconData, color: Colors.grey,),
              const SizedBox(width: 16.0),
              Flexible( // Utilize o Flexible para evitar o overflow do texto
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      boldText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      maxLines: 2, // Defina o número máximo de linhas para limitar o tamanho do texto
                      overflow: TextOverflow.ellipsis, // Defina o tipo de overflow caso o texto ultrapasse o limite
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      lightText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
