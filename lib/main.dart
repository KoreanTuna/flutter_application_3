import 'package:flutter/material.dart';
import 'package:flutter_application_3/game2.dart';

import 'my_game.dart';

void main() {
  runApp(const MaterialApp(home: Menu()));
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyGameWidget(game: GameLesson02()),
      ),
    );
  }
}
