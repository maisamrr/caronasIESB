import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFind extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFind({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double fem = MediaQuery.of(context).textScaleFactor;
    final double ffem = fem * 1.0;

    return Container(
      margin: EdgeInsets.fromLTRB(8 * fem, 0 * fem, 8 * fem, 32 * fem),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Container(
            width: double.infinity,
            height: 56 * fem,
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(24 * fem, 16 * fem, 16 * fem, 16 * fem),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.612),
                borderRadius: BorderRadius.circular(16 * fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14263f33),
                    offset: Offset(0 * fem, 8 * fem),
                    blurRadius: 8 * fem,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 7 * fem, 0 * fem),
                    width: 16 * fem,
                    height: 16 * fem,
                    child: SvgPicture.asset(
                      'assets/search.svg',
                      width: 16 * fem,
                      height: 16 * fem,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 1 * fem, 88 * fem, 1 * fem),
                    padding:
                        EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
                    height: double.infinity,
                    child: Text(
                      'Qual seu destino?',
                      style: TextStyle(
                        fontFamily: 'Inria Sans',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1975 * ffem / fem,
                        letterSpacing: 0.18 * fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 1, 1, 1),
                    width: 48 * fem,
                    height: 24 * fem,
                    child: SvgPicture.asset(
                      'assets/clock.svg',
                      width: 24 * fem,
                      height: 24 * fem,
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
