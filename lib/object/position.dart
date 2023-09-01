import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/my_game.dart';

class CenterComponent extends PositionComponent {
  CenterComponent({required Paint? paint})
      : _paint = paint ?? Paint()
          ..color = const Color(0xffffffff),
        super(
            position: Vector2(worldSize.x / 2, 1),
            size: Vector2(10, 10),
            anchor: Anchor.center);
  Paint _paint;
  @override
  Future<void> onLoad() async {
    await add(PositionComponent(position: Vector2(1, 1)));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(const Offset(10, 10), 1, _paint);
  }
}
