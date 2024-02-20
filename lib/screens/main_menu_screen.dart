import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globalgamerschallenge/game/flappy_bird_game.dart';

import '../game/assets.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame flappyBirdGame;
  static const String id = 'mainMenu';

  const MainMenuScreen({Key? key, required this.flappyBirdGame}): super(key: key);

  @override
  Widget build(BuildContext context) {
    flappyBirdGame.pauseEngine();

    return MaterialApp(home: Scaffold(
      body: GestureDetector(
          onTap: () {
            flappyBirdGame.overlays.remove('mainMenu');
            flappyBirdGame.resumeEngine();
          },
          child:Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/menu.jpg'),
                fit: BoxFit.cover,
            ),
          ),
          child: Image.asset('assets/images/message.png'),
      )),
    ));
  }
}