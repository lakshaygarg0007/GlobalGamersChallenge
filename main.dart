import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'flappy_bird_game.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}
