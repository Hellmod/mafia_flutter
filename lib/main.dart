import 'dart:ui';

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          // homescreenaFs (154:18151)
          width: double.infinity,
          height: 844,
          decoration: const BoxDecoration (
            color: Color(0xff1e1e1e),
          ),
          child:
          Stack(
            children: [
              const Positioned(
                // mafia4Rw (154:18152)
                left: 6,
                top: 0,
                child:
                Align(
                  child:
                  SizedBox(
                    width: 382,
                    height: 213,
                    child:
                    Text(
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
              ),
              const Positioned(
                // mafiaX4d (154:18153)
                left: 0,
                top: 168,
                child:
                Align(
                  child:
                  SizedBox(
                    width: 382,
                    height: 213,
                    child:
                    Text(
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
              ),
              const Positioned(
                // mafiaDi9 (154:18154)
                left: 190,
                top: 168,
                child:
                Align(
                  child:
                  SizedBox(
                    width: 382,
                    height: 213,
                    child:
                    Text(
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
              ),
              Positioned(
                // kartaL25 (154:18155)
                left: 51.3134765625,
                top: 215.958984375,
                child:
                Container(
                  padding: EdgeInsets.fromLTRB(58.92, 356.09, 58.92, 24.99),
                  width: 290.18,
                  height: 411.09,
                  /*decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(15.491060257),
                    border:  const Border (
                    ),
                    image:  DecorationImage (
                      fit:  BoxFit.cover,
                      image:  NetworkImage (
                          [Image url]
                      ),
                    ),
                  ),*/
                  child:
                  const Text(
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
              ),
              Positioned(
                // rectangle3848Keh (154:18163)
                left: 0,
                top: 0,
                child:
                ClipRect(
                  child:
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 9,
                      sigmaY: 9,
                    ),
                    child:
                    Align(
                      child:
                      SizedBox(
                        width: 390,
                        height: 844,
                        child:
                        Container(
                          decoration: const BoxDecoration (
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
              ),
              /* Positioned(
                // backbuttonwRB (154:18164)
                left:  330,
                top:  52,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  44,
                    height:  44,
                    child:
                    Image.network(
                      [Image url]
                      width:  44,
                      height:  44,
                    ),
                  ),
                ),
              ),*/
              Positioned(
                // frame427320286FRs (154:18166)
                left: 17,
                top: 102,
                child:
                Container(
                  width: 358,
                  height: 556,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // frame427320285xr5 (154:18167)
                        margin: EdgeInsets.fromLTRB(15.5, 0, 15.5, 64),
                        width: double.infinity,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // mafia6Bb (154:18170)
                              margin: EdgeInsets.fromLTRB(0, 0, 13, 12),
                              child:
                              Text(
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
                            ),
                            Center(
                              // wcielsiwroljednegozczonkwmafii (154:18171)
                              child:
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 327,
                                ),
                                child:
                                const Text(
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
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // frame427320279EBK (154:18172)
                        width: double.infinity,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // wybierztyprozgrywkiyub (154:18173)
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 11),
                              child:
                              Text(
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
                            ),
                            Container(
                              // frame427320278HvH (154:18174)
                              width: double.infinity,
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // buttonFcD (154:18175)
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                    padding: EdgeInsets.fromLTRB(
                                        75.5, 16, 75.5, 15),
                                    width: double.infinity,
                                    height: 162,
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
                                                Center(
                                                  // moderowanarozgrywkaXTF (154:18181)
                                                  child:
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 0, 4),
                                                    child:
                                                    Text(
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
                                                Container(
                                                  // obecnogamemasteraRYd (154:18182)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 3),
                                                  child:
                                                  Text(
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
                                                  Row(
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
                                  ),
                                  Container(
                                    // buttonwfP (154:18186)
                                    padding: EdgeInsets.fromLTRB(
                                        47.5, 16, 47.5, 15),
                                    width: double.infinity,
                                    height: 162,
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
                                    child:
                                    Container(
                                      // frame427320270T7w (154:18187)
                                      width: double.infinity,
                                      height: double.infinity,
                                      child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          /*Container(
                                            // frame427320275bzq (154:18188)
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
                                            // frame427320277i3s (154:18191)
                                            width: double.infinity,
                                            child:
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Center(
                                                  // brakmoderacjiG5P (154:18192)
                                                  child:
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 0, 4),
                                                    child:
                                                    Text(
                                                      'Brak moderacji',
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
                                                Container(
                                                  // rolgamemasteraprzejmujeaplikac (154:18193)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 3),
                                                  child:
                                                  Text(
                                                    'Rolę Game Mastera przejmuje aplikacja',
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
                                                  // frame427320302geu (154:18194)
                                                  margin: EdgeInsets.fromLTRB(
                                                      79, 0, 79, 0),
                                                  width: double.infinity,
                                                  child:
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      /*Container(
                                                        // userspFK (154:18195)
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
                                                        // graczyj7P (154:18196)
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
              ),
              Positioned(
                // frame427320288G7K (154:18197)
                left: 16,
                top: 768,
                child:
                Container(
                  width: 358,
                  height: 44,
                  child:
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                  Container(
                  // frame427320287ynR (154:18198)
                  margin: EdgeInsets.fromLTRB(0, 0, 135, 0),
                  height: double.infinity,
                  child:
                  Row(
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
                        child:
                        Container(
                          // containercKb (154:18200)
                          width: 129,
                          height: double.infinity,
                          child:
                          Center(
                            child:
                            Text(
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
                        child:
                        Container(
                          // containerEbs (154:18205)
                          width: 128.5,
                          height: double.infinity,
                          child:
                          Center(
                            child:
                            Text(
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
                /*Container(
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
                  child:
                  Container(
                    // containerfx5 (154:18210)
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 3.1),
                    width: 126,
                    height: double.infinity,
                    child:
                    Align(
                      // facebookRRT (154:18211)
                      alignment: Alignment.centerLeft,
                      child:
                      SizedBox(
                          width: 18,
                          height: 17.9,
                          child:
                          Container()
                        Container(
                                margin:  EdgeInsets.fromLTRB(0, 0, 108, 0),
                                child:
                                Image.network(
                                  [Image url]
                                  width:  18,
                                  height:  17.9,
                                ),
                      ),
                    ),
                  ),
                ),*/

            ],
          ),
        ),
      ),
      ],
    ),
    ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: _incrementCounter,
    tooltip: "Increment",
    child: const Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
