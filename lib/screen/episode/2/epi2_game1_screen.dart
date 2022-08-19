import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../widget/app_widget.dart';
import '../1/epi1_game1_screen.dart';



class Epi2Game1Screen extends StatefulWidget {
  const Epi2Game1Screen({Key? key}) : super(key: key);

  @override
  State<Epi2Game1Screen> createState() => _Epi2Game1ScreenState();
}

class _Epi2Game1ScreenState extends State<Epi2Game1Screen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: '',
        child: IndexedStack(
          children: [
              Container(

              )
          ],
        ),
      ),
    );
  }
}
