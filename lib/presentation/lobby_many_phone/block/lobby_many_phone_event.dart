part of 'lobby_many_phone_bloc.dart';

@immutable
abstract class LobbyManyPhoneEvent extends Equatable {
  const LobbyManyPhoneEvent();
}

class OnNewGameClick extends LobbyManyPhoneEvent {
  @override
  List<Object> get props => [];
}

class OnRemoveUserClick extends LobbyManyPhoneEvent {
  @override
  List<Object> get props => [];
}

class OnSaveUserClick extends LobbyManyPhoneEvent {
  final String userName;

  const OnSaveUserClick({required this.userName});

  @override
  List<Object> get props => [userName];
}

class CheckIdExists extends LobbyManyPhoneEvent {
  final String idgame;

  const CheckIdExists({required this.idgame});

  @override
  List<Object> get props => [idgame];
}

class AddUser extends LobbyManyPhoneEvent {
  final User user;

  const AddUser({required this.user});

  @override
  List<Object> get props => [user];
}
