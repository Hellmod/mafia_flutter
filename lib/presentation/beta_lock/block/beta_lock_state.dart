part of 'beta_lock_bloc.dart';

@immutable
abstract class BetaLockState extends Equatable {
  const BetaLockState();
}

class InitState extends BetaLockState {
  @override
  List<Object> get props => [];
}

class NavToHomeState extends BetaLockState {
  @override
  List<Object> get props => [];
}
