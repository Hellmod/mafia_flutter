import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool background1 = false;
  bool background2 = false;

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _firestore
        .collection('background_states')
        .doc('state')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        background1 = snapshot['background1'];
        background2 = snapshot['background2'];
      });
    });
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
                ),
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
                ),
                Positioned(
                  top: 52.0,
                  right: 16.0,
                  child: Align(
                    child: InkWell(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "Trwają prace nad funkcjonalnością",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1), // Border o szerokości 1px
                          borderRadius: BorderRadius.circular(12), // Dodaje zaokrąglenie 12px
                        ),
                        child: SvgPicture.asset(
                          'assets/images/UserCircle.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}
