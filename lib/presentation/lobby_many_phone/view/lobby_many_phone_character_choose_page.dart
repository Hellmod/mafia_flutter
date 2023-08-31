import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafia/utils/character/Character.dart';

import '../../../models/User.dart';
import '../../../utils/AppTextStyles.dart';
import '../../../utils/Utility.dart';
import '../block/lobby_many_phone_bloc.dart';

class LobbyManyPhoneCharacterChoose extends StatefulWidget {
  final List<Character> characters;

  LobbyManyPhoneCharacterChoose({Key? key, required this.characters})
      : super(key: key);

  @override
  _LobbyManyPhoneCharacterChoose createState() =>
      _LobbyManyPhoneCharacterChoose(characters);
}

class _LobbyManyPhoneCharacterChoose
    extends State<LobbyManyPhoneCharacterChoose> {
  LobbyManyPhoneBloc? myBloc;

  final List<Character> characters;
  String userNick = '';

  _LobbyManyPhoneCharacterChoose(this.characters);

  @override
  void initState() {
    super.initState();
    myBloc = context.read<LobbyManyPhoneBloc>();
  }

  Widget toolBar() => Row(
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
            'Wybór postaci',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.5999999728,
              color: Color(0xffa3a3a3),
            ),
          ),
        ],
      );

  Widget pageTitle() => Container(
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wybierz role',
            style: TextStyle(
              fontFamily: 'Clash Display Variable',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1.2999999523,
              color: Color(0xffffffff),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Wybierz role do rozgrywki, które zostaną rozlosowane wśród graczy',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.5999999728,
              color: Color(0xffffffff),
            ),
          ),
        ],
      ));

  Widget villageSeparator() => Row(
        children: [
          // Linia po lewej stronie
          Expanded(
            child: Container(
              height: 1,
              color: Color(0xFFCCCACA),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Wieś',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Color(0xFFCCCACA),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
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
                      toolBar(),
                      const SizedBox(height: 40),
                      pageTitle(),
                      const SizedBox(height: 24),
                      villageSeparator(),
                      const SizedBox(height: 24),
                      RoleCadSelected(
                        imageUrl: 'assets/images/character_sailor.png',
                        roleName: 'Szeryf',
                        amount: 0,
                      ),
                      const SizedBox(height: 16),
                      RoleCard(
                          imageUrl: 'assets/images/character_sailor.png',
                          roleName: 'Marynarz'),
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
                      Utility.workingOn();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppTextStyles.goldGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Dalej',
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

class RoleCard extends StatelessWidget {
  final String imageUrl;
  final String roleName;

  RoleCard({required this.imageUrl, required this.roleName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
      width: 171,
      height: 240,
      decoration: BoxDecoration(
        color: Color(0x33ffffff),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: Align(
              child: SizedBox(
                width: 151,
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 178,
            child: Align(
              child: SizedBox(
                width: 151,
                height: 52,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(0, 0.5),
                      end: Alignment(0, -1),
                      colors: <Color>[Color(0xff161a22), Color(0x0027343f)],
                      stops: <double>[0, 1],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 22,
            top: 193,
            child: Align(
              child: SizedBox(
                width: 65,
                height: 21,
                child: Text(
                  roleName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleCadSelected extends StatelessWidget {
  final String imageUrl;
  final String roleName;
  final int amount;

  RoleCadSelected(
      {required this.imageUrl, required this.roleName, required this.amount});

  @override
  Widget build(BuildContext context) {
    bool isSelected = amount <= 0;

    return Container(
      width: 171,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: AppTextStyles.goldGradient,
      ),
      child: Stack(
        children: [
          Positioned(
            // rectangle38554bh (267:21202)
            left: 10,
            top: 10,
            child: Align(
              child: SizedBox(
                width: 151,
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 178,
            child: Align(
              child: SizedBox(
                width: 151,
                height: 52,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(-0.007, 0.538),
                      end: Alignment(0, -1),
                      colors: <Color>[Color(0xff161a22), Color(0x0027343f)],
                      stops: <double>[0, 1],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // frame427320370ohh (267:21204)
            left: 22,
            top: 147,
            child: Container(
              width: 125,
              height: 67,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      roleName,
                      style: AppTextStyles.amountInCard,
                    ),
                  ),
                  Container(
                    // frame427320345dRq (267:21206)
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DecreaseAmountButton(onPressed: () {  },),
                        //SizedBox(width: 16),
                        const Text(
                          '0',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.5999999728,
                            color: Colors.white,
                          ),
                        ),
                        //SizedBox(width: 16),
                        IncreaseAmountButton(onPressed: () {  },),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // checkcirclejdH (267:21212)
            left: 129,
            top: 18,
            child: Align(
              child: SvgPicture.asset(
                'assets/images/CheckCircle.svg',
                fit: BoxFit.cover,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IncreaseAmountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IncreaseAmountButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: AppTextStyles.goldGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DecreaseAmountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DecreaseAmountButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Color(0xFF626262),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(
              Icons.remove,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}







