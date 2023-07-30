part of 'home_bloc.dart';

@immutable
abstract class HomeState  extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}