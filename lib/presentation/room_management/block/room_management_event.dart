part of 'room_management_bloc.dart';

@immutable
abstract class RoomManagementEvent extends Equatable {
  const RoomManagementEvent();
}

class RestartBlock extends RoomManagementEvent {
  @override
  List<Object> get props => [];
}

class TokenPageConnectClick extends RoomManagementEvent {
  final String idRoom;

  const TokenPageConnectClick({required this.idRoom});

  @override
  List<Object> get props => [idRoom];
}

class OnNewGameClick extends RoomManagementEvent {
  @override
  List<Object> get props => [];
}