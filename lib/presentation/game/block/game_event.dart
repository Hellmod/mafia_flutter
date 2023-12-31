part of 'game_bloc.dart';

@immutable
abstract class GameEvent extends Equatable {
  const GameEvent();
}

class OnRevealCardClicked extends GameEvent {
  @override
  List<Object> get props => [];
}

class OnRevealNextRevealCardClicked extends GameEvent {
  @override
  List<Object> get props => [];
}

class OnMakeActionClicked extends GameEvent {
  final User user;

  const OnMakeActionClicked({required this.user});

  @override
  List<Object> get props => [user];
}
