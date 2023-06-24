import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'heomeScreanButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: (Container(
          // homescreenaFs (154:18151)
          width: double.infinity,
          height: 844,
          decoration: const BoxDecoration(
            color: Color(0xff1e1e1e),
          ),
          child: Stack(
            children: [
              const Positioned(
                // mafia4Rw (154:18152)
                left: 6,
                top: 0,
                child: Align(
                  child: SizedBox(
                    width: 382,
                    height: 213,
                    child: Text(
                      'Mafia',
                      style: TextStyle(
                        fontFamily: 'Clash Display Variable',
                        fontSize: 169.3164520264,
                        fontWeight: FontWeight.w600,
                        height: 1.2575,
                        letterSpacing: -3.3863290405,
                      ),
                    ),
                  ),
                ),
              ),//MAFIA
              const Positioned(
                // mafiaX4d (154:18153)
                left: 0,
                top: 168,
                child: Align(
                  child: SizedBox(
                    width: 382,
                    height: 213,
                    child: Text(
                      'Mafia',
                      style: TextStyle(
                        fontFamily: 'Clash Display Variable',
                        fontSize: 169.3164520264,
                        fontWeight: FontWeight.w600,
                        height: 1.2575,
                        letterSpacing: -3.3863290405,
                      ),
                    ),
                  ),
                ),
              ),//MAFIA
              const Positioned(
                // mafiaDi9 (154:18154)
                left: 190,
                top: 168,
                child: Align(
                  child: SizedBox(
                    width: 382,
                    height: 213,
                    child: Text(
                      'Mafia',
                      style: TextStyle(
                        fontFamily: 'Clash Display Variable',
                        fontSize: 169.3164520264,
                        fontWeight: FontWeight.w600,
                        height: 1.2575,
                        letterSpacing: -3.3863290405,
                      ),
                    ),
                  ),
                ),
              ),//MAFIA
              Positioned(
                // kartaL25 (154:18155)
                left: 51.3134765625,
                top: 215.958984375,
                child: Container(
                  padding: EdgeInsets.fromLTRB(58.92, 356.09, 58.92, 24.99),
                  width: 290.18,
                  height: 411.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.491060257),
                    border: const Border(),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/karta.png"),
                    ),
                  ),
                  child: const Text(
                    'Mafia',
                    style: TextStyle(
                      fontFamily: 'Clash Display Variable',
                      fontSize: 23.2365894318,
                      fontWeight: FontWeight.w600,
                      height: 1.2575,
                      letterSpacing: -0.4647317886,
                      color: Color(0x7fffffff),
                    ),
                  ),
                ),
              ),//KARTA
              Positioned(
                // rectangle3848Keh (154:18163)
                left: 0,
                top: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 9,
                      sigmaY: 9,
                    ),
                    child: Align(
                      child: SizedBox(
                        width: 390,
                        height: 844,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: RadialGradient(
                              center: Alignment(-0, -0),
                              radius: 0.5,
                              colors: <Color>[
                                Color(0xcc2f404b),
                                Color(0xcc161a22)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),//GRADIENT
              Positioned(
                // backbuttonwRB (154:18164)
                left: 330,
                top: 52,
                child: Align(
                  child: SizedBox(
                    width: 44,
                    height: 44,
                    child: SvgPicture.asset(
                      'assets/images/UserCircle.svg',
                      width: 44,
                      height: 44,
                    ),
                  ),
                ),
              ),//UŻYTKOWNIK
              Positioned(
                // frame427320286FRs (154:18166)
                left: 17,
                top: 102,
                child: Container(
                  width: 358,
                  height: 556,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // frame427320285xr5 (154:18167)
                        margin: EdgeInsets.fromLTRB(15.5, 0, 15.5, 64),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // mafia6Bb (154:18170)
                              margin: EdgeInsets.fromLTRB(0, 0, 13, 12),
                              child: const Text(
                                'Mafia',
                                style: TextStyle(
                                  fontFamily: 'Clash Display Variable',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2575,
                                  letterSpacing: -0.64,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),//MAFIA
                            Center(
                              // wcielsiwroljednegozczonkwmafii (154:18171)
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 327,
                                ),
                                child: const Text(
                                  'Wciel się w rolę jednego z członków mafii lub mieszkańca miasta, który za wszelką cenę chce pozbyć się gangsterów ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    letterSpacing: -0.48,
                                    color: Color(0xffa3a3a3),
                                  ),
                                ),
                              ),
                            ),//Opis
                          ],
                        ),
                      ),//NAGŁÓWEK
                      Container(
                        // frame427320279EBK (154:18172)
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // wybierztyprozgrywkiyub (154:18173)
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                              child: const Text(
                                'Wybierz typ rozgrywki:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6000000636,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),//Wybierz typ rozgrywki
                            Container(
                              // frame427320278HvH (154:18174)
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HomeScreanButton(
                                    title: "Moderowana rozgrywka",
                                    body: "Obecność Game Mastera",
                                    details: "4-16 graczy",
                                    marginBottom: 12,
                                  ),
                                  HomeScreanButton(
                                    title: "Brak moderacji",
                                    body:
                                        "Rolę Game Mastera przejmuje aplikacja",
                                    details: "4-16 graczy",
                                    marginBottom: 0,
                                  ),
                                ],
                              ),
                            ),//Przyciski
                          ],
                        ),
                      ),//PRZYCISK WYBORU GRY
                    ],
                  ),
                ),
              ),//Opis
              Positioned(
                // frame427320288G7K (154:18197)
                left: 16,
                top: 768,
                child: Container(
                  width: 358,
                  height: 44,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // frame427320287ynR (154:18198)
                        margin: EdgeInsets.fromLTRB(0, 0, 135, 0),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // buttonWnM (154:18199)
                              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                              width: 89,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x7f595959),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x192f2b43),
                                    offset: Offset(0, 1),
                                    blurRadius: 1.5,
                                  ),
                                ],
                              ),
                              child: Container(
                                // containercKb (154:18200)
                                width: 129,
                                height: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Jak grać',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.7142857143,
                                      letterSpacing: -0.14,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // buttonKE1 (154:18204)
                              padding: EdgeInsets.fromLTRB(16.5, 10, 0, 10),
                              width: 82,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x7f595959),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x192f2b43),
                                    offset: Offset(0, 1),
                                    blurRadius: 1.5,
                                  ),
                                ],
                              ),
                              child: Container(
                                // containerEbs (154:18205)
                                width: 128.5,
                                height: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Twórcy',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.7142857143,
                                      letterSpacing: -0.14,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // buttonx25 (154:18209)
                        padding: EdgeInsets.fromLTRB(13, 10, 0, 10),
                        width: 44,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0x7f595959),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x192f2b43),
                              offset: Offset(0, 1),
                              blurRadius: 1.5,
                            ),
                          ],
                        ),
                        child: Container(
                          // containerfx5 (154:18210)
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 3.1),
                          width: 126,
                          height: double.infinity,
                          child: Align(
                            // facebookRRT (154:18211)
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 18,
                              height: 17.9,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 108, 0),
                                child: SvgPicture.asset(
                                  'assets/images/Facebook.svg',
                                  width: 18,
                                  height: 17.9,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),//Jak grać, Twórcy, Facebook
            ],
          ),
        )),
      ),
    ));
  }
}
