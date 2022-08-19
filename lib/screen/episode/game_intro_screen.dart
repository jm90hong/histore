

import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';

class GameIntroScreen extends StatefulWidget {

  int episodeIndex=1;
  int gameIndex=1;
  String bgPath='';
  String crPath='';



  GameIntroScreen({
    required this.episodeIndex,
    required this.gameIndex,
    required this.bgPath,
    this.crPath='',
    Key? key
  }) : super(key: key);

  @override
  State<GameIntroScreen> createState() => _GameIntroScreenState();
}

class _GameIntroScreenState extends State<GameIntroScreen> {

  var result = false;

  var contentMap = {
    '2-1':{
      't':'이성계의 마음 이해하기',
      'c' : '이성계 장군님이 요즘 ...'
    }
  };



  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        Navigator.pop(context,result);

        return result;
      },
      child: Scaffold(
        body: BackgroundContainer(
          imagePath: widget.bgPath,
          child: Stack(
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
                            'Episode ',
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
                          Text('제목',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          Text('내용',
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
                            result=true;
                            Navigator.pop(context,result);
                          }
                      ),
                    )




                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
