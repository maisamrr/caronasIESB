import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFind extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFind({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 32),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Container(
            width: double.infinity,
            height: 56,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 16, 16, 16),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.973),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14263f33),
                    offset: Offset(0, 8),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                    width: 20,
                    height: 24,
                    child: SvgPicture.asset(
                      'assets/search.svg',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 1, 88, 1),
                    padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                    height: double.infinity,
                    child: Text(
                      'Qual seu destino?',
                      style: TextStyle(
                        fontFamily: 'Inria Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.1975,
                        letterSpacing: 0.18,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 1, 1, 1),
                    width: 48,
                    height: 24,
                    child: SvgPicture.asset(
                      'assets/clock.svg',
                      width: 24,
                      height: 24,
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
