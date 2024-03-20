import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/Utility.dart';
import '../../../utils/Wigets.dart';
import '../../lobby_many_phone/block/lobby_bloc.dart';
import '../block/beta_lock_bloc.dart';

class BetaLockPage extends StatefulWidget {

  @override
  _BetaLockPage createState() => _BetaLockPage();
}

class _BetaLockPage extends State<BetaLockPage>  {
  BetaLockBloc? myBloc;

  String roomId = '';

  @override
  void initState() {
    super.initState();
    myBloc = context.read<BetaLockBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BetaLockBloc, BetaLockState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is InitState) {
            return Container(
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Blokada aplikacji',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5999999728,
                                  color: Color(0xffa3a3a3),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Klucz gry',
                            style: TextStyle(
                              fontFamily: 'Clash Display Variable',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 1.2999999523,
                              color: Color(0xffffffff),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Wpisz klucz gry aby uruchomić aplikację',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.5999999728,
                              color: Color(0xffa3a3a3),
                            ),
                          ),
                          const SizedBox(height: 23),
                          Container(
                            width: double.infinity,
                            child: Pinput(
                              onCompleted: (pin) => {
                                myBloc!.add(CheckGameKeyClick(gameKey: pin))
                              },
                              onChanged: (value) => {
                                roomId = value
                              },
                              length: 6,
                              defaultPinTheme: defaultPinTheme,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    // frame427320286FRs (154:18166)
                    left: 16,
                    right: 16,
                    bottom: 32,
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          myBloc?.add(CheckGameKeyClick(gameKey: roomId));
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
                                'Ok',
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
            );
          }
          return MainWidget.loadingWidget("beta lock loading...");
        });
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
