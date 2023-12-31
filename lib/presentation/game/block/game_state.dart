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
