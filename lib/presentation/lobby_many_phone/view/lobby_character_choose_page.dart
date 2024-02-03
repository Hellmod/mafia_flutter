import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/AppTextStyles.dart';
import '../../../utils/character/CharacterRepository.dart';
import '../../wigets/RoleCard.dart';
import '../block/lobby_bloc.dart';

class LobbyCharacterChoosePage extends StatefulWidget {
  LobbyCharacterChoosePage({Key? key}) : super(key: key);

  @override
  _LobbyManyPhoneCharacterChoose createState() =>
      _LobbyManyPhoneCharacterChoose();
}

class _LobbyManyPhoneCharacterChoose
    extends State<LobbyCharacterChoosePage> {
  LobbyBloc? myBloc;

  void navGame() {
    myBloc?.add(OnStartClick(amount: 1, jakistekst: 'jakis tekst'));
    Navigator.pushNamed(context, '/game',
        arguments: {'roomId': myBloc?.roomId});
  }

  String userNick = '';

  @override
  void initState() {
    super.initState();
    myBloc = context.read<LobbyBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LobbyBloc, LobbyState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is LobbyManyPhoneCharacterChooseState) {
            return Container(
              width: double.infinity,
              color: const Color(0xff1e1e1e),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        fit: StackFit.loose,
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
                                CharacterGrid(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottomBar(state.charactersToChoose),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget bottomBar(int amount) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0x00343F00), Color(0xFF161A22)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    amount.toString() + '  ',
                    style: AppTextStyles.textInter(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Pozostałych\n wyborów',
                    style: AppTextStyles.textInter(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 7,
                child: InkWell(
                  onTap: () {
                    //RM
                    navGame();
                    // Utility.workingOn();
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
                          style: AppTextStyles.text16_600,
                        ),
                      ),
                    ),
                  ),
                )),
          ]),
        ),
      );

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
                myBloc?.add(LobbyCharacterChooseBackClick());
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
}

class CharacterGrid extends StatelessWidget {
  final characters = CharacterRepository.instance.getCharacters();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: characters
          .map((character) => RoleCardWidget(character: character))
          .toList(),
    );
  }
}
