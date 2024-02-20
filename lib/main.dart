import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:globalgamerschallenge/screens/game_over_screen.dart';
import 'package:globalgamerschallenge/screens/main_menu_screen.dart';

import 'game/flappy_bird_game.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(flappyBirdGame: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}