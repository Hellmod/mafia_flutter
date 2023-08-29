import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/User.dart';
import '../../../utils/Utility.dart';
import '../../wigets/yourNickName.dart';
import '../block/lobby_many_phone_bloc.dart';

class LobbyManyPhoneLobbyUserList extends StatefulWidget {
  final List<User> users;

  LobbyManyPhoneLobbyUserList({Key? key, required this.users})
      : super(key: key);

  @override
  _LobbyManyPhoneLobbyUserList createState() =>
      _LobbyManyPhoneLobbyUserList(users);
}

class _LobbyManyPhoneLobbyUserList extends State<LobbyManyPhoneLobbyUserList> {
  LobbyManyPhoneBloc? myBloc;

  final List<User> users;
  String userNick = '';

  _LobbyManyPhoneLobbyUserList(this.users);

  @override
  void initState() {
    super.initState();
    myBloc = BlocProvider.of<LobbyManyPhoneBloc>(context);
  }

  String formatRoomId(String? roomId) {
    if (roomId == null) return "000 - 000";
    if (roomId.length != 6) return roomId;
    return roomId.substring(0, 3) + " - " + roomId.substring(3, 6);
  }

  Widget yourUserListWidget(List<User> users) {
    return Container(
        height: 50,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}.",
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0x99ffffff),
                    ),
                  ),
                  Text(
                    users[index].name,
                    style: const TextStyle(
                      fontFamily: 'Clash Display Variable',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                    ),
                  ),
                  IconButton(
                    //ToDo usuń
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Utility.workingOn();
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    LobbyManyPhoneUserListState? state =
        myBloc?.state as LobbyManyPhoneUserListState?;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color(0xff1e1e1e),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const Text(
                            'Lobby gry',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.5999999728,
                              color: Color(0xffa3a3a3),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.qr_code,
                                  color: Colors.white),
                              onPressed: () {
                                Utility.workingOn();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Udostępnij swój token rozgrywki aby inni gracze mogli wziąć udział w rozgrywce',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.6,
                          color: Color(0xffa3a3a3),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        height: 56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 294,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0x33ffffff)),
                                color: Color(0x07ffffff),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  formatRoomId(state?.roomId),
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 38,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              child: IconButton(
                                icon:
                                    const Icon(Icons.copy, color: Colors.white),
                                onPressed: () {
                                  Utility.workingOn();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Utility.workingOn();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0x7f595959),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x192f2b43),
                                offset: Offset(0, 1),
                                blurRadius: 1.5,
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Udostępnij  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Icon(Icons.share, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color(0x33ffffff),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Twój nick:',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      UserInputOrDisplay(myBloc: myBloc),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0x33ffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        child: const Text(
                          'Lista graczy',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Column(
                            children: [
                              BlocBuilder<LobbyManyPhoneBloc,
                                  LobbyManyPhoneState>(
                                builder: (context, state) {
                                  if (state is LobbyManyPhoneUserListState) {
                                    return Expanded(
                                      child: yourUserListWidget(state.users),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                            ],
                          )),
                    ],
                  )),
              Positioned(
                left: 16,
                right: 16,
                bottom: 32,
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Tu umieść swoją funkcję do wykonania po naciśnięciu przycisku
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFB445), Color(0xFFD85C30)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'rozpocznij rozgrywkę',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ), //Dalej button
            ],
          ),
        ),
      ),
    );
  }
}
