



import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';

class Epi3Game2SuccessScreen extends StatefulWidget {
  @override
  _Epi3Game2SuccessScreenState createState() => _Epi3Game2SuccessScreenState();
}

class _Epi3Game2SuccessScreenState extends State<Epi3Game2SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/image/episode3/bg8.jpg',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SimpleButton(
                  imagePath: 'assets/icon/btn_complete.png',
                  width: 75,
                  onTap: (){
                    Navigator.pop(context);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}



