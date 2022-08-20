import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';



class Epi2Game2Screen extends StatefulWidget {
  const Epi2Game2Screen({Key? key}) : super(key: key);

  @override
  State<Epi2Game2Screen> createState() => _Epi2Game2ScreenState();
}

class _Epi2Game2ScreenState extends State<Epi2Game2Screen> {

  var result = false;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,result);
        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
          imagePath: 'assets/image/episode2/gg.png',
          child: Stack(
            children: [
              Positioned(
                  top: 175,
                  right: 50,
                  child: GestureDetector(
                    onTap: (){
                      result=true;
                      Navigator.pop(context,result);
                      showToast('개경까지 가는 빠른길 게임 성공');
                    },
                    child: Container(
                      width: 260,
                      height: 40,
                      color: Colors.transparent,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
