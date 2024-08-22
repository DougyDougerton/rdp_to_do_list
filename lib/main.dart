import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  runApp(const MainApp());

    //Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

//Initialize Firebase with the current platform's default opitions
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('we got a simpur Hellerr Werld!!'),
        ),
      ),
    );
  }
}
