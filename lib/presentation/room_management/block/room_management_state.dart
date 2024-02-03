part of 'room_management_bloc.dart';

@immutable
abstract class RoomManagementState extends Equatable {
  const RoomManagementState();
}

class InitialState extends RoomManagementState {
  @override
  List<Object> get props => [];
}

class NavToLobbyManyPhoneState extends RoomManagementState {
  final String roomId;

  NavToLobbyManyPhoneState({
    required this.roomId,
  });

  @override
  List<Object> get props => [roomId];
}
