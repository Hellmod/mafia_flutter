part of 'game_bloc.dart';

@immutable
abstract class GameEvent extends Equatable {
  const GameEvent();
}

class OnNewGameClick extends GameEvent {
  @override
  List<Object> get props => [];
}

