import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mafia/presentation/beta_lock/block/beta_lock_page.dart';
import 'package:mafia/presentation/game/block/game_page.dart';
import 'package:mafia/presentation/home/block/home_page.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_page.dart';
import 'package:mafia/presentation/room_management/block/room_management_page.dart';

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
      home: BetaLockPage(),
      routes: {
        '/dashboard': (context) => HomePage(),
        '/beta_lock': (context) => BetaLockPage(),
        '/lobby': (context) {
          final routeArgs = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;
          return LobbyPage(
            roomId: routeArgs?['roomId'],
          );
        },
        '/room_management': (context) => RoomManagementPage(),
        '/game': (context) {
          final routeArgs = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;
          return GamePage(
            roomId: routeArgs?['roomId'],
          );
        },
      },
    );
  }
}
