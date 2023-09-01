import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter_application_3/object/ball_dynamic.dart';

import 'my_game.dart';
import 'object/floor_static.dart';

late SpriteAnimation colorChange;

class GameLesson02 extends MyGame with TapDetector, HasTappablesBridge {
  @override
  Future<void> onLoad() async {
    print('on Load');
    super.onLoad();
    final red1 = await loadSprite('red_1.png');
    final red2 = await loadSprite('red_2.png');
    final red3 = await loadSprite('red_3.png');
    final red4 = await loadSprite('red_4.png');
    final red5 = await loadSprite('red_5.png');
    final red6 = await loadSprite('red_6.png');
    final red7 = await loadSprite('red_7.png');
    colorChange = SpriteAnimation.spriteList([
      red1,
      red2,
      red3,
      red4,
      red5,
      red6,
      red7,
    ], stepTime: 0.06, loop: false);

    add(FloorStatic());
    add(LeftStatic());
    add(RightStatic());
  }

  @override
  void onTapDown(TapDownInfo event) {
    print('tap down');
    super.onTapDown(event);
    add(ColorBall());
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    // print("update");
  }
}
