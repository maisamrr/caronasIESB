import 'package:flutter/material.dart';

class CustomFind extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFind({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 32),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14263f33),
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: const Icon(
                      Icons.search,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Qual seu destino?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 1, 1, 1),
                    child: const Icon(
                      Icons.schedule,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}