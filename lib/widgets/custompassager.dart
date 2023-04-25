import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPassager extends StatelessWidget {
  final String passagerName;
  final String passagerAddress;
  final DateTime passagerHour;

  const CustomPassager(
      {super.key,
      required this.passagerName,
      required this.passagerAddress,
      required this.passagerHour});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 50,
          top: 500,
          child: Container(
            width: 346,
            height: 52,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  padding: EdgeInsets.fromLTRB(13, 6, 6, 6),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffececec),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 1, 9, 0),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(214, 214, 214, 0.612),
                          borderRadius: BorderRadius.circular(17.5),
                        ),
                        child: Icon(Icons.person),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 68, 2),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                              child: Text(
                                passagerName,
                                style: TextStyle(
                                  fontFamily: 'Inria Sans',
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            Text(
                              passagerAddress,
                              style: TextStyle(
                                fontFamily: 'Inria Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.none,
                                height: 1.2,
                                color: Color.fromARGB(255, 53, 53, 53),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffff8ac5),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text(
                            passagerHour.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inria Sans',
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
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
