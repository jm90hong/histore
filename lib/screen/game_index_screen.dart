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
    1:'장수왕의 평양천도',
    2:'이성계의 회군',
    3:'임진왜란',
    4:'을지문덕 대전투'
  };


  var contentMap={
    1:'장수와의평양천도\n내용',
    2:'이성계의 회군\n내용',
    3:'임진왜란\n내용',
    4:'을지문덕 대전투\n내용',
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
