part of 'lobby_many_phone_bloc.dart';

@immutable
abstract class LobbyManyPhoneEvent extends Equatable {
  const LobbyManyPhoneEvent();
}

class OnRemoveUserClick extends LobbyManyPhoneEvent {
  @override
  List<Object> get props => [];
}

class OnNextInLobbyClick extends LobbyManyPhoneEvent {
  @override
  List<Object> get props => [];
}

class OnLobbyUserListBackClick extends LobbyManyPhoneEvent {
  @override
  List<Object> get props => [];
}

class OnSaveUserClick extends LobbyManyPhoneEvent {
  final String userName;

  const OnSaveUserClick({required this.userName});

  @override
  List<Object> get props => [userName];
}

class OnIncreaseAmountCharacterClick extends LobbyManyPhoneEvent {
  final int amount;
  final Character character;

  const OnIncreaseAmountCharacterClick({required this.amount, required this.character});

  @override
  List<Object> get props => [amount, character];
}

class AddUser extends LobbyManyPhoneEvent {
  final User user;

  const AddUser({required this.user});

  @override
  List<Object> get props => [user];
}

//Character choose page
class OnStartClick extends LobbyManyPhoneEvent {
  final int amount;
  final String jakistekst;

  const OnStartClick({required this.amount, required this.jakistekst});

  @override
  List<Object> get props => [amount, jakistekst];
}
