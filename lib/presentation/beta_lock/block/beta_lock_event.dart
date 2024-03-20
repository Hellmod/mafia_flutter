part of 'beta_lock_bloc.dart';

@immutable
abstract class BetaLockEvent extends Equatable {
  const BetaLockEvent();
}

class RestartBlock extends BetaLockEvent {
  @override
  List<Object> get props => [];
}

class CheckGameKeyClick extends BetaLockEvent {
  final String gameKey;

  const CheckGameKeyClick({required this.gameKey});

  @override
  List<Object> get props => [gameKey];
}