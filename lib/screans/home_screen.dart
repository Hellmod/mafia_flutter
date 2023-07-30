import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mafia/screans/wigets/heomeScreanButton.dart';
import '../presentation/lobby_many_phone/view/lobby_many_phone_token_page.dart';
import 'lobby_one_phone_add_user_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void workingOn() {
    Fluttertoast.showToast(
        msg: "Trwają prace nad funkcjonalnością",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void navToLobby() {
    //TODO: change name
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LobbyAddUserScreen()),
    );
  }

  void navToToken() {
    //TODO: change name
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LobbyTokenScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              color: Color(0xff1e1e1e),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 319,
                  height: 411,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/card.png"),
                    ),
                  ),
                ), //Karta
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 9,
                    sigmaY: 9,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        colors: <Color>[Color(0xcc2f404b), Color(0xcc161a22)],
                      ),
                    ),
                  ),
                ), //rozmazanie Karty
                Positioned(
                  top: 52.0,
                  right: 16.0,
                  child: Align(
                    child: InkWell(
                      onTap: () {
                        workingOn();
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/UserCircle.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ), //UserButton
                Positioned(
                  // frame427320286FRs (154:18166)
                  left: 18,
                  right: 18,
                  top: 104,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            'Mafia',
                            style: TextStyle(
                              fontFamily: 'Clash Display Variable',
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.64,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ), //MAFIA
                        Container(
                          // wybierztyprozgrywkiyub (154:18173)
                          margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: const Text(
                            "Wciel się w rolę jednego z członków mafii lub mieszkańca miasta, który za wszelką cenę chce pozbyć się gangsterów ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffA4A4A4),
                            ),
                          ),
                        ), //Description
                        Container(
                          // wybierztyprozgrywkiyub (154:18173)
                          margin: const EdgeInsets.fromLTRB(0, 64, 0, 0),
                          child: const Text(
                            'Wybierz typ rozgrywki:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ), //Zachęta
                        HomeScreanButton(
                          title: "Moderowana rozgrywka",
                          body: "Obecność Game Mastera",
                          details: "4-16 graczy",
                          icon: "assets/images/SmileyWink.svg",
                          callback: navToLobby,
                        ),
                        HomeScreanButton(
                          title: "Brak moderacji",
                          body: "Rolę Game Mastera przejmuje aplikacja",
                          details: "4-16 graczy",
                          icon: "assets/images/DeviceMobile.svg",
                          callback: navToToken,
                        ),
                      ],
                    ),
                  ),
                ), //main content
                Positioned(
                  bottom: 32.0,
                  left: 16.0,
                  child: Row(children: [
                    TextButton(
                        onPressed: () {
                          workingOn();
                        },
                        child: Container(
                            height: 44,
                            margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            decoration: BoxDecoration(
                              color: const Color(0x7f595959),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x192f2b43),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: const Center(
                                child: Text(
                              'Jak grać',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.14,
                                color: Color(0xffffffff),
                              ),
                            )))),
                    TextButton(
                        onPressed: () {
                          workingOn();
                        },
                        child: Container(
                            height: 44,
                            margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            decoration: BoxDecoration(
                              color: const Color(0x7f595959),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x192f2b43),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: const Center(
                                child: Text(
                              'Twórcy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.14,
                                color: Color(0xffffffff),
                              ),
                            )))),
                  ]),
                ), //about, creators
                Positioned(
                  bottom: 32.0,
                  right: 16.0,
                  child: InkWell(
                    onTap: () {
                      workingOn();
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/Facebook.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ), //FacebookButton
              ],
            )));
  }
}
