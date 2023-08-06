part of 'lobby_many_phone_bloc.dart';

@immutable
abstract class LobbyManyPhoneState extends Equatable {
  const LobbyManyPhoneState();
}

class LobbyManyPhoneInitial extends LobbyManyPhoneState {
  @override
  List<Object> get props => [];
}
class LobbyManyPhoneUserListState extends LobbyManyPhoneState {
  final List<User> users;

  LobbyManyPhoneUserListState({required this.users});

  @override
  List<Object> get props => [users];
}

