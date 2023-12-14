part of 'game_bloc.dart';

@immutable
abstract class GameState extends Equatable {
  const GameState();
}

class GameRevealCardState extends GameState {
  final List<User> users;
  final User user;
  final String roomId;
  final bool isUserInGame;

  GameRevealCardState(
      {required this.users,
      required this.user,
      required this.roomId,
      required this.isUserInGame});

  @override
  List<Object> get props => [users, user, roomId, isUserInGame];
}

class GameInitialState extends GameState {
  @override
  List<Object> get props => [];
}

