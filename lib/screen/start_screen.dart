

import 'package:flutter/material.dart';
import 'package:histore/screen/home_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';


class StartScreen extends StatefulWidget {


  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/background/bg3.jpg')
            )
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/logo.png',width: 300,),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleButton(
                  imagePath: 'assets/icon/btn_start.png',
                  width: 100,
                  onTap: (){
                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: HomeScreen()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
