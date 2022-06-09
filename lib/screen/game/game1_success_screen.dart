



import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';

class Game1SuccessScreen extends StatefulWidget {
  @override
  _Game1SuccessScreenState createState() => _Game1SuccessScreenState();
}

class _Game1SuccessScreenState extends State<Game1SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/bg2.png',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/lv1_history_paper.png',height: 240,),
            const SizedBox(height: 10,),
            SimpleButton(
                imagePath: 'assets/icon/btn_complete.png',
                width: 75,
                onTap: (){
                  Navigator.pop(context);
                }
            )
          ],
        ),
      ),
    );
  }
}
