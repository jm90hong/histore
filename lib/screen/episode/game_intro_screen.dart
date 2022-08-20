

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
  String? title='';
  String? content='';

  var contentMap = {
    '2-1':{
      't':'이성계의 마음 이해하기',
      'c' :'이성계 장군님이 요즘 ...'
    },
    '2-2':{
      't':'개경까지 가는 가장 빠른길 고르기',
      'c' :'개경까지 가는 가장 빠른길 고르기 내용'
    },
    '3-1':{
      't':'찬반논쟁 선택 게임',
      'c' :'찬반논쟁 선택 게임 내용'
    },
    '3-2':{
      't':'훈민정음 헤레본 찾기',
      'c' :'훈민정음 헤레본 찾기 내용'
    }
  };



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String tag = '${widget.episodeIndex}-${widget.gameIndex}';
    title=contentMap[tag]!['t'];
    content=contentMap[tag]!['c'];

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        Navigator.pop(context,result);

        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
          imagePath: widget.bgPath,
          child: Stack(
            alignment: Alignment.center,
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
                      padding: const EdgeInsets.only(top: 65),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('$title',style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          Text('$content',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),
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
