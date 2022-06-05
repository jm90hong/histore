import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';

class GameIndexScreen extends StatefulWidget {

  int episodeIndex;
  Function onStartTap;

  GameIndexScreen({Key? key,
    required this.episodeIndex,
    required this.onStartTap
  }) : super(key: key);

  @override
  _GameIndexScreenState createState() => _GameIndexScreenState();
}

class _GameIndexScreenState extends State<GameIndexScreen> {


  var titleMap = {
    1:'광개토대왕 유서 찾기',
    2:'직속하인 찾기',
    3:'평양 잠정 탐색',
    4:'게임4'
  };


  var contentMap={
    1:'광개토대왕 유서 찾기\n내용',
    2:'직속하인 찾기\n내용',
    3:'평양 잠정 탐색\n내용',
    4:'게임4\n내용',
  };






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/bg4.png',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 500,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/image/duru.png'),
                  Positioned(
                    top: 8,
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icon/long_box1.png')
                          )
                      ),
                      child: Center(
                        child: Text(
                          'Episode ${widget.episodeIndex}',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
                        ),
                      ),
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.only(top: 65),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${titleMap[widget.episodeIndex]}',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 20,),
                        Text('${contentMap[widget.episodeIndex]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    child: SimpleButton(
                        imagePath: 'assets/icon/btn_start.png',
                        width: 90,
                        onTap: (){
                          widget.onStartTap();
                        }
                    ),
                  )




                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
