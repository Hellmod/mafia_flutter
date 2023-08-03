part of 'lobby_many_phone_bloc.dart';

@immutable
abstract class LobbyManyPhoneEvent extends Equatable {
  const LobbyManyPhoneEvent();
}

class OnNewGameClick extends LobbyManyPhoneEvent {
  @override
  List<Object> get props => [];
}

class CheckIdExists extends LobbyManyPhoneEvent {
  final String idgame;

  const CheckIdExists({required this.idgame});

  @override
  List<Object> get props => [idgame];
}
