// custom_container.dart
import 'package:flutter/material.dart';

class HomeScreanButton extends StatelessWidget {
/*
  final double width;
  final double height;
  final Color color;

  CustomContainer({this.width, this.height, this.color});
*/

  @override
  Widget build(BuildContext context) {
    return Container(
      // buttonFcD (154:18175)
      margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
      padding: const EdgeInsets.fromLTRB(
          75.5, 16, 75.5, 15),
      width: double.infinity,
      height: 162,
      decoration: BoxDecoration(
        color: Color(0x7f595959),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x192f2b43),
            offset: Offset(0, 1),
            blurRadius: 1.5,
          ),
        ],
      ),
      child:
      Container(
        // frame427320270KMB (154:18176)
        width: double.infinity,
        height: double.infinity,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment
              .center,
          children: [
            /*Container(
                                            // frame427320275UE5 (154:18177)
                                            margin:  EdgeInsets.fromLTRB(0, 0, 0, 12),
                                            width:  40,
                                            height:  40,
                                            child:
                                            Image.network(
                                              [Image url]
                                              width:  40,
                                              height:  40,
                                            ),
                                          ),*/
            Container(
              // frame427320276mys (154:18180)
              width: double.infinity,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment
                    .center,
                children: [
                  Center(//RM część
                    // moderowanarozgrywkaXTF (154:18181)
                    child:
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          0, 0, 0, 4),
                      child:
                      const Text(//RM
                        'Moderowana rozgrywka',
                        textAlign: TextAlign
                            .center,
                        style: TextStyle(
                          fontFamily: 'Clash Display Variable',
                          fontSize: 20,
                          fontWeight: FontWeight
                              .w600,
                          height: 1.3,
                          color: Color(
                              0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Container(//RM część
                    // obecnogamemasteraRYd (154:18182)
                    margin: EdgeInsets.fromLTRB(
                        0, 0, 0, 3),
                    child:
                    const Text(
                      'Obecność Game Mastera',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight
                            .w500,
                        height: 1.5999999728,
                        color: Color(0xffa3a3a3),
                      ),
                    ),
                  ),
                  Container(
                    // frame427320302jpD (154:18183)
                    margin: EdgeInsets.fromLTRB(
                        51, 0, 51, 0),
                    width: double.infinity,
                    child:
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .center,
                      children: [
                        /*Container(
                                                        // users5NH (154:18184)
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 8, 1),
                                                        width:  16,
                                                        height:  16,
                                                        child:
                                                        Image.network(
                                                          [Image url]
                                                          width:  16,
                                                          height:  16,
                                                        ),
                                                      ),*/
                        Text(
                          // graczy1Fw (154:18185)
                          '4-16 graczy',
                          textAlign: TextAlign
                              .center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight
                                .w500,
                            height: 1.5999999728,
                            color: Color(
                                0xffa3a3a3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
