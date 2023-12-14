import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:mafia/presentation/game/block/game_page.dart';
import 'package:mafia/presentation/home/block/home_page.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_many_phone_page.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/dashboard': (context) => HomePage(),
        '/many_phone': (context) => LobbyManyPhonePage(),
        '/game': (context) => GamePage(),
      },
    );
  }
}