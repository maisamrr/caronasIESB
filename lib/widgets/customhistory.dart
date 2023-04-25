import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHistory extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomHistory({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(13, 100, 18, 0),
      width: double.infinity,
      height: 67,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
            height: 43,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 2, 26, 0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 237, 237, 100),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 35,
                  height: 35,
                  child: SvgPicture.asset(
                    "assets/carona_icon.svg",
                    width: 35,
                    height: 35,
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Text(
                          'IESB Sul',
                          style: TextStyle(
                            fontFamily: 'Inria Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            decoration: TextDecoration.none,
                            letterSpacing: 0.18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'SGAS Quadra 613/614, Via L2 Sul',
                        style: TextStyle(
                          fontFamily: 'Inria Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          decoration: TextDecoration.none,
                          letterSpacing: 0.12,
                          color: Color.fromRGBO(198, 196, 202, 100),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 11, 0, 0),
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              "assets/right_arrow.svg",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
