import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool background1 = false;
  bool background2 = false;

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _firestore
        .collection('background_states')
        .doc('state')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        background1 = snapshot['background1'];
        background2 = snapshot['background2'];
      });
    });
  }

  _updateBackgroundStates() async {
    try {
      await _firestore.collection('background_states').doc('state').set({
        'background1': background1,
        'background2': background2,
      });
      print("RMRM ok");
    } catch (e) {
      print("RMRM: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    background1 = !background1;
                  });
                  _updateBackgroundStates();
                },
                child: Text("elo zieloneee!!"),
              ),
              const SizedBox(height: 30),
              Container(
                color: background1 ? Colors.amber : Colors.black12,
                width: double.infinity,
                height: 34,
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  setState(() {
                    background2 = !background2;
                  });
                  _updateBackgroundStates();
                },
                child: Text("elo czerwone!!"),
              ),
              const SizedBox(height: 30),
              Container(
                color: background2 ? Colors.yellow : Colors.red,
                width: double.infinity,
                height: 34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
