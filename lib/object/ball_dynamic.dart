import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

import '../my_game.dart';

class BallDynamic extends BodyComponent {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(worldSize.x / 2, 1),
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = .45;
    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .5
      ..restitution = 0.5;
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..angularVelocity = radians(180);
  }
}

class ColorBall extends BodyComponent with TapCallbacks {
  ColorBall() : super(paint: Paint()..color = Colors.white);
  double size = 0.5;
  @override
  void onTapDown(TapDownEvent event) {
    add(
      ColorEffect(
        Color.fromARGB(255, 255, 68, 40),
        const Offset(0.0, 0.8),
        CurvedEffectController(0.8, Curves.bounceOut),
      ),
    );
    // TODO: implement onTapDown
    super.onTapDown(event);
  }
  // @override
  // bool onTapDown(TapDownInfo info) {

  //   return super.onTapDown(info);
  // }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      // userData: this,
      position: Vector2(worldSize.x / 2, 1),
      type: BodyType.dynamic,
    );
    final shape = CircleShape()..radius = size;
    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .5
      ..restitution = 0.2;
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..angularVelocity = radians(100);
  }
}

class CustomSizeEffect2 extends Effect with EffectTarget<ScaleProvider> {
  CustomSizeEffect2(
    Vector2 scaleFactor,
    super.controller, {
    super.onComplete,
  }) : _scaleFactor = scaleFactor.clone();

  final Vector2 _scaleFactor;
  late Vector2 _scaleDelta;

  @override
  void onStart() {
    _scaleDelta = Vector2(
      target.scale.x * (_scaleFactor.x - 1),
      target.scale.y * (_scaleFactor.y - 1),
    );
  }

  @override
  void apply(double progress) {
    final dProgress = progress - previousProgress;
    target.scale += _scaleDelta * dProgress;
  }
}
