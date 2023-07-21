import 'package:flutter/material.dart';

class LobbyTokenScreen extends StatelessWidget {
  const LobbyTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xff1e1e1e),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Token gry',
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
                      'Wpisz token gry aby dołączyć do rozgrywki',
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          tokenBox('_'),
                          tokenBox('_'),
                          tokenBox('_'),
                          const SizedBox(
                            width: 20,
                            height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0x33d9d9d9),
                              ),
                            ),
                          ),
                          tokenBox('_'),
                          tokenBox('_'),
                          tokenBox('_'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0x7f595959)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.fromLTRB(16, 12, 16, 16)),
                      ),
                      onPressed: () {}, // replace with your function
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Stwórz rozgrywkę',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.add, size: 20)
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
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {}, // replace with your function
                child: const Text(
                  'Dalej',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ), //Dalej button
          ],
        ),
      ),
    );
  }

  Widget tokenBox(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x33ffffff)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Clash Display Variable',
            fontSize: 48,
            fontWeight: FontWeight.w600,
            height: 1.2575,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
