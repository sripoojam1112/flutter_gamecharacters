import 'package:flutter/material.dart';
import 'package:flutter_gamecharacters/screens/home/home.dart';
import 'package:flutter_gamecharacters/services/global_characterstore.dart';
import 'package:flutter_gamecharacters/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(                             // ChangeNotifierProvider is a widget wh provides a widget tree with a change notifier
    create: (context) => GlobalCharacterstore(),             // create is func that returns changenotifier; now v r providing the entire app with the GlobalCharacterstore change notifier that means now v can consume data from the GlobalCharacterstore within in the app when needed.
    child: MaterialApp(
      theme: myTheme,
      home: const Home(),
    ),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.blueGrey,
    ),
    body: const Text('Sandbox'),
    );
  }
}

