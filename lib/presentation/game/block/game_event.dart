part of 'game_bloc.dart';

@immutable
abstract class GameEvent extends Equatable {
  const GameEvent();
}

class OnRevealCardClicked extends GameEvent {
  @override
  List<Object> get props => [];
}

