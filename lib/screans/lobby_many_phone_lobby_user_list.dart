import 'package:flutter/material.dart';

class LobbyManyPhoneLobbyUserList extends StatelessWidget {
  LobbyManyPhoneLobbyUserList({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
                              onPressed: () {},
                            ),
                          ),
                          const Text(
                            'Stwórz rozgrywkę',
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
                              onPressed: () {},
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // frame427320354UJB (267:21461)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 8 * fem, 0 * fem),
                              width: 294 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0x33ffffff)),
                                color: Color(0x07ffffff),
                                borderRadius: BorderRadius.circular(8 * fem),
                              ),
                              child: Center(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter Text',
                                  ),
                                  onChanged: (text) {
                                    print("Text Field: $text");
                                  },
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
                                icon: const Icon(Icons.copy,
                                    color: Colors.white),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        // buttonSuD (267:21465)
                        padding: EdgeInsets.fromLTRB(
                            129 * fem, 12 * fem, 100 * fem, 12 * fem),
                        width: double.infinity,
                        height: 48 * fem,
                        decoration: BoxDecoration(
                          color: Color(0x7f595959),
                          borderRadius: BorderRadius.circular(12 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x192f2b43),
                              offset: Offset(0 * fem, 1 * fem),
                              blurRadius: 1.5 * fem,
                            ),
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 5 * fem, 0 * fem),
                                  child: Text(
                                    'Udostępnij',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.8,
                                      letterSpacing: -0.14 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    3 * fem, 2 * fem, 3 * fem, 2 * fem),
                                width: 52 * fem,
                                height: double.infinity,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 20 * fem,
                                    height: 20 * fem,
                                    child: IconButton(
                                      icon: const Icon(Icons.share,
                                          color: Colors.white),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        // rectangle3869M2X (267:21471)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 25 * fem),
                        width: double.infinity,
                        height: 1 * fem,
                        decoration: BoxDecoration(
                          color: Color(0x33ffffff),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        // twjnickQWb (267:21473)
                        'Twój nick',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5 * ffem / fem,
                          letterSpacing: -0.16 * fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          // fieldX5R (267:21474)
                          padding: EdgeInsets.fromLTRB(
                              16 * fem, 12 * fem, 16 * fem, 12 * fem),
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0x4cffffff)),
                            borderRadius: BorderRadius.circular(12 * fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x192f2b43),
                                offset: Offset(0 * fem, 1 * fem),
                                blurRadius: 1.5 * fem,
                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Text',
                            ),
                            onChanged: (text) {
                              print("Text Field: $text");
                            },
                          )),
                      const SizedBox(height: 24),
                      Container(
                        // autogroup2g5mZXu (NB4ZwqjJnYDBRww8Sq2G5M)
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 17 * fem, 0 * fem, 2 * fem),
                        width: double.infinity,
                        child: Align(
                          // rectangle3870ubm (267:21477)
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 1 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x33ffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        // listagraczyeJT (267:21478)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 25 * fem),
                        child: Text(
                          'Lista graczy',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            letterSpacing: -0.16 * fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        height: 108,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // marekVbu (267:21486)

                              child: Text(
                                '1.',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5 * ffem / fem,
                                  letterSpacing: -0.16 * fem,
                                  color: Color(0x99ffffff),
                                ),
                              ),
                            ),
                            Container(
                              // marekVbu (267:21486)
                              child: Text(
                                'Marek',
                                style: TextStyle(
                                  fontFamily: 'Clash Display Variable',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2575 * ffem / fem,
                                  letterSpacing: -0.4 * fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {},
                            ),
                          ],
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
