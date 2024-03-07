part of 'lobby_bloc.dart';

@immutable
abstract class LobbyState extends Equatable {
  const LobbyState();
}

class LobbyInitial extends LobbyState {
  @override
  List<Object> get props => [];
}

class LobbyUserListState extends LobbyState {//RM
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

class LobbyManyPhoneCharacterChooseState extends LobbyState {
  final List<Character> characters;
  final int charactersToChoose;

  LobbyManyPhoneCharacterChooseState(
      {required this.characters, required this.charactersToChoose});

  @override
  List<Object> get props => [characters, charactersToChoose];
}

class NavigateToGamePageState extends LobbyState {
  final String roomId;

  NavigateToGamePageState(this.roomId);

  @override
  List<Object> get props => [roomId];
}

class LoadingState extends LobbyState {
  @override
  List<Object> get props => [];
}
