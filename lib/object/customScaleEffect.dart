import 'package:flame/components.dart';
import 'package:flame/effects.dart';

class CustomSizeEffect extends Transform2DEffect {
  CustomSizeEffect(
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
