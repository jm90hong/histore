import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';

class Game4Screen extends StatefulWidget {
  @override
  _Game4ScreenState createState() => _Game4ScreenState();
}

class _Game4ScreenState extends State<Game4Screen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        imagePath: 'assets/background/bg1.png',
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text('123')
          ],
        )
    );
  }
}
