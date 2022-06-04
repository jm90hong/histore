

import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';



//todo 광개토 대왕 유서 찾기
class Game1Screen extends StatefulWidget {
  @override
  _Game1ScreenState createState() => _Game1ScreenState();
}

class _Game1ScreenState extends State<Game1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/royal_bg_game.jpg',
        child: Column(
          children: [

          ],
        ),

      ),
    );
  }
}
