part of 'game_bloc.dart';

@immutable
abstract class GameState extends Equatable {
  const GameState();
}

class GameInitialState extends GameState {
  @override
  List<Object> get props => [];
}

class GameRealCardState extends GameState {
  final User user;

  GameRealCardState({
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
      ];
}

class GameNightState extends GameState {
  final User user;
  final List<User> users;

  GameNightState({
    required this.user,
    required this.users,
  });

  @override
  List<Object> get props => [
        user,
        users,
      ];
}

class GameWaitingForOthersActionsState extends GameState {
  @override
  List<Object> get props => [];
}

class GameRevealKilledPersonState extends GameState {
  final List<User> usersThatChanged;

  GameRevealKilledPersonState({
    required this.usersThatChanged,
  });

  @override
  List<Object> get props => [usersThatChanged];
}

class GameDayState extends GameState {
  final User user;
  final List<User> users;

  GameDayState({
    required this.user,
    required this.users,
  });

  @override
  List<Object> get props => [
    user,
    users,
  ];
}

class GameFinishedState extends GameState {
  final bool isMafiaWon;

  GameFinishedState({
    required this.isMafiaWon,
  });

  @override
  List<Object> get props => [isMafiaWon];
}

