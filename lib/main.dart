import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15.5, 0, 15.5, 64),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // mafiaYph (26:17176)
                    margin: EdgeInsets.fromLTRB(0, 0, 13, 12),
                    child: const Text(
                      'Mafia',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.2575,
                        letterSpacing: -0.64,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Center(
                    // wcielsiwroljednegozczonkwmafii (26:17270)
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 327,
                      ),
                      child: const Text(
                        'Wciel się w rolę jednego z członków mafii lub mieszkańca miasta, który za wszelką cenę chce pozbyć się gangsterów ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: -0.48,
                          color: Color(0xffa3a3a3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "You have pushed the button this many times:",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
