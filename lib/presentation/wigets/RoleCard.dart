import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/AppTextStyles.dart';
import '../../utils/character/Character.dart';
import '../lobby_many_phone/block/lobby_bloc.dart';

class RoleCardWidget extends StatefulWidget {
  final Character character;

  const RoleCardWidget(
      {super.key, required this.character});

  @override
  State<RoleCardWidget> createState() => _RoleCardState(character);
}

class _RoleCardState extends State<RoleCardWidget> {
  LobbyBloc? myBloc;

  final Character character;
  int amount = 0;

  @override
  void initState() {
    super.initState();
    myBloc = context.read<LobbyBloc>();
  }

  _RoleCardState(this.character);

  void increaseAmount(){
    ++amount;
    myBloc?.add(OnIncreaseAmountCharacterClick(
        amount: amount,
        character: character
    ));
  }

  void decreaseAmount(){
    --amount;
    myBloc?.add(OnIncreaseAmountCharacterClick(
        amount: amount,
        character: character
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (amount == 0) {
            setState(() {
              increaseAmount();
            });
          }
        },
        child: Container(
          width: 171,
          height: 240,
          decoration: BoxDecoration(
            gradient: amount > 0 ? AppTextStyles.goldGradient : null,
            color: amount > 0 ? null : Color(0x33ffffff),
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
                        character.cardPath,
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
              (amount > 0)
                  ? Positioned(
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
                                character.name,
                                style: AppTextStyles.amountInCard,
                              ),
                            ),
                            Container(
                              // frame427320345dRq (267:21206)
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DecreaseAmountButton(
                                    onPressed: () {
                                      setState(() {
                                        decreaseAmount();
                                      });
                                    },
                                  ),
                                  //SizedBox(width: 16),
                                  Text(
                                    amount.toString(),
                                    style: AppTextStyles.text16_500,
                                  ),
                                  //SizedBox(width: 16),
                                  IncreaseAmountButton(
                                    onPressed: () {
                                      setState(() {
                                        increaseAmount();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Positioned(
                      left: 22,
                      top: 193,
                      child: Align(
                        child: SizedBox(
                          width: 65,
                          height: 21,
                          child: Text(
                            character.name,
                            style: AppTextStyles.amountInCard,
                          ),
                        ),
                      ),
                    ),
              (amount > 0)
                  ? Positioned(
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
                    )
                  : Container(),
            ],
          ),
        ));
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

  const DecreaseAmountButton({Key? key, required this.onPressed})
      : super(key: key);

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
