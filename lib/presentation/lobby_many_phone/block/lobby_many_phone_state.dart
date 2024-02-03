part of 'lobby_many_phone_bloc.dart';

@immutable
abstract class LobbyManyPhoneState extends Equatable {
  const LobbyManyPhoneState();
}

class Lobbynitial extends LobbyManyPhoneState {
  @override
  List<Object> get props => [];
}

class LobbyUserListState extends LobbyManyPhoneState {//RM
  final List<User> users;
  final User user;
  final String roomId;
  final bool isUserInGame;

  LobbyUserListState(
      {required this.users,
      required this.user,
      required this.roomId,
      required this.isUserInGame});

  @override
  List<Object> get props => [users, user, roomId, isUserInGame];
}

class LobbyManyPhoneCharacterChooseState extends LobbyManyPhoneState {
  final List<Character> characters;
  final int charactersToChoose;

  LobbyManyPhoneCharacterChooseState(
      {required this.characters, required this.charactersToChoose});

  @override
  List<Object> get props => [characters, charactersToChoose];
}

class NavigateToGamePageState extends LobbyManyPhoneState {
  final String roomId;

  NavigateToGamePageState(this.roomId);

  @override
  List<Object> get props => [roomId];
}

class LoadingState extends LobbyManyPhoneState {
  @override
  List<Object> get props => [];
}
