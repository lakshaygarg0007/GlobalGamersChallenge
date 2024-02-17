import 'package:flame/game.dart';
import 'components/background.dart';

class FlappyBirdGame extends FlameGame {
  @override
  Future<void> onLoad() async{
      add(Background());
  }
}
