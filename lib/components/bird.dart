import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import '../game/config.dart';
import '/game/assets.dart';
import '/game/flappy_bird_game.dart';
import '/game/bird_movement.dart';
import 'package:flame/effects.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();
  int score = 0;

  @override
  Future<void> onLoad() async {
    final birdMid = await gameRef.loadSprite(Assets.birdMid);
    final birdUp = await gameRef.loadSprite(Assets.birdUp);
    final birdDown = await gameRef.loadSprite(Assets.birdDown);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle : birdMid,
      BirdMovement.up: birdUp,
      BirdMovement.down: birdDown
    };

    add(CircleHitbox());
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      )
    );
    current = BirdMovement.up;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
    ) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void gameOver() {
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    gameRef.isHit = true;
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity*dt;
  }




}
