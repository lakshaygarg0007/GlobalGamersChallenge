import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:globalgamerschallenge/components/ground.dart';
import 'package:globalgamerschallenge/components/pipe_group.dart';
import '../components/background.dart';
import '../components/bird.dart';
import 'package:flame/components.dart';
import 'config.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async{
      addAll(
          [
            Background(),
            Ground(),
            bird = Bird(),
            score = buildScore(),
          ]
      );

      interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y/2 * 0.2),
      anchor: Anchor.center,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

}