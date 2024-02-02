import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mafia/presentation/game/block/game_bloc.dart';
import 'package:mafia/presentation/game/block/game_page.dart';
import 'package:mafia/presentation/game/view/game_night_action_page.dart';
import 'package:mafia/presentation/game/view/game_reveal_card_page.dart';
import 'package:mafia/presentation/game/view/game_reveal_card_page_card_reviled_page.dart';
import 'package:mafia/presentation/home/block/home_bloc.dart';
import 'package:mafia/presentation/home/block/home_page.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_many_phone_page.dart';
import 'package:mafia/services/FirebaseGameService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final firebaseGameService = FirebaseGameService('555555'); // Popraw identyfikator

  runApp(App(firebaseGameService: firebaseGameService));
}

class App extends StatelessWidget {
  final FirebaseGameService firebaseGameService;
  late final GoRouter _router;

  App({required this.firebaseGameService}) {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
            child: HomePage(), // Popraw na odpowiednią stronę główną
          ),
        ),
        GoRoute(
          path: '/game/home:roomId',
          builder: (BuildContext context, GoRouterState state)=> BlocProvider<GameBloc>(
            create: (context) => GameBloc(firebaseGameService),
            child: GameRevealCard(), // Popraw na odpowiednią stronę główną
          ),
        ),
        GoRoute(
          path: '/game/reveal-card-reviled',
          builder: (BuildContext context, GoRouterState state) => BlocProvider<GameBloc>(
            create: (context) => GameBloc(firebaseGameService),
            child: GameNightActionPage(), // Popraw na odpowiednią stronę główną
          ),
        ),

        // Dodaj więcej tras zgodnie z potrzebami aplikacji
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Game App',
    );
  }
}