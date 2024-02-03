part of 'lobby_bloc.dart';

@immutable
abstract class LobbyEvent extends Equatable {
  const LobbyEvent();
}

class OnRemoveUserClick extends LobbyEvent {
  @override
  List<Object> get props => [];
}

class LobbyUserListStartClick extends LobbyEvent {
  @override
  List<Object> get props => [];
}

class LobbyCharacterChooseBackClick extends LobbyEvent {
  @override
  List<Object> get props => [];
}

class OnSaveUserClick extends LobbyEvent {
  final String userName;

  const OnSaveUserClick({required this.userName});

  @override
  List<Object> get props => [userName];
}

class OnIncreaseAmountCharacterClick extends LobbyEvent {
  final int amount;
  final Character character;

  const OnIncreaseAmountCharacterClick({required this.amount, required this.character});

  @override
  List<Object> get props => [amount, character];
}

class AddUser extends LobbyEvent {
  final User user;

  const AddUser({required this.user});

  @override
  List<Object> get props => [user];
}

//Character choose page
class OnStartClick extends LobbyEvent {
  final int amount;
  final String jakistekst;

  const OnStartClick({required this.amount, required this.jakistekst});

  @override
  List<Object> get props => [amount, jakistekst];
}
