import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/screen/game/game2_screen.dart';
import 'package:histore/screen/game_index_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../game/game1_screen.dart';
import '../../game/game3_screen.dart';
import '../../game/game4_screen.dart';
import '../../game/game5_screen.dart';

class Episode1ChatScreen extends StatefulWidget {


  @override
  _Episode1ChatScreenState createState() => _Episode1ChatScreenState();
}

class _Episode1ChatScreenState extends State<Episode1ChatScreen> {

  String a = "대한";
  String b = "장수왕";
  String whoSay = '대한';
  int currentChatIndex=0;
  String msg='';
  bool isStartGame=false;



  List<Map> chatList = [];

  int _game1Index=4;
  int _game2Index=10;
  int _game3Index=16;
  int _game4Index=20;
  int _game5Index=23;

  List<String> imagePathList=[
    'smile.png',
    'angry.png',
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList=[
      {
        'sayer':a,
        'value':'대화1-1'
      },
      {
        'sayer':b,
        'value':'대화1-2'
      },
      {
        'sayer':a,
        'value':'대화1-3'
      },
      {
        'sayer':b,
        'value':'대화1-4'
      },
      {
        'sayer':'game',
        'value':'game1'
      },
      {
        'sayer':b,
        'value':'대단하군.. 게임1을 성공했구나!'
      },

      {
        'sayer':a,
        'value':'대화2-1'
      },
      {
        'sayer':b,
        'value':'대화2-2'
      },
      {
        'sayer':a,
        'value':'대화2-3'
      },
      {
        'sayer':b,
        'value':'대화2-4'
      },
      {
        'sayer':'game',
        'value':'game2'
      },
      {
        'sayer':b,
        'value':'오 대단하군.. 게임2을 성공했구나!'
      },
      {
        'sayer':a,
        'value':'대화3-1'
      },
      {
        'sayer':a,
        'value':'대화3-2'
      },
      {
        'sayer':a,
        'value':'대화3-3'
      },
      {
        'sayer':a,
        'value':'대화3-4'
      },
      {
        'sayer':'game',
        'value':'game3'
      },
      {
        'sayer':b,
        'value':'정말 대단하군.. 게임3을 성공했구나!'
      },
      {
        'sayer':b,
        'value':'바로 게임4를 시작하지..'
      },
      {
        'sayer':a,
        'value':'좋아요!'
      },
      {
        'sayer':'game',
        'value':'game4'
      },
      {
        'sayer':b,
        'value':'정말 대단하군.. 게임4을 성공했구나!'
      },
      {
        'sayer':b,
        'value':'자 그럼 마지막으로 최종 추리를 해보지..'
      },
      {
        'sayer':'game',
        'value':'game5'
      },
      {
        'sayer':b,
        'value':'드디어 모든 임무가 완료 되었네 수고했단다..'
      },
    ];
    msg=chatList[currentChatIndex]['value'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/bg4.png',
        child: Stack(
          alignment: Alignment.center,
          children: [ //todo 캐릭터

            Positioned(
                bottom: -50,
                left: 120,
                child: Image.asset('assets/image/a.png',width: 170,fit: BoxFit.cover,)
            ),

            Positioned(
                bottom: -50,
                right: 120,
                child: Image.asset('assets/image/b.png',width: 170,fit: BoxFit.cover,)
            ),

            Positioned(
              bottom: 30,
              child: Container(
                width: 520,
                height: 100,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      width: 500,
                      height: 80,
                      child: Center(
                        child: Text(msg),
                      ),
                    ),

                    Positioned(
                      top: 5,
                      left: whoSay=='대한' ? 30 : null,
                      right: whoSay=='장수왕' ? 30 : null,
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration:const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/duru.png')
                            )
                        ),
                        child: Center(
                          child: Text(
                            whoSay,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.5
                            ),),
                        ),
                      ),
                    ),

                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: Consumer<GameResultModel>(
                        builder: (context, resultModel, child){

                          return SimpleButton(
                              imagePath: 'assets/icon/btn_right.png',
                              width: 33,
                              onTap: (){

                                if(currentChatIndex==chatList.length){
                                  //todo 모든 미션 성공
                                  showToast('축하합니다. 에피소드1을 모두 완료하였습니다!');
                                  //todo 성공 로직 처리 백엔드
                                  Provider.of<UserModel>(context,listen: false).clearStage(stage: 'stage1');
                                  Navigator.pop(context,'ok');
                                  return;
                                }

                                setState(() {
                                  currentChatIndex++;
                                  if(chatList[currentChatIndex]['sayer'] == 'game'){
                                    var gameType = chatList[currentChatIndex]['value'];
                                    switch (gameType){
                                      case 'game1':
                                        Navigator.push(context, PageTransition(
                                            type: PageTransitionType.fade,
                                            child: GameIndexScreen(
                                              episodeIndex: 1,
                                              onStartTap: () async{
                                                var result= await Navigator.pushReplacement(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType.fade,
                                                      child: Game1Screen()
                                                    )
                                                );
                                                if(result=='ok'){
                                                  setState(() {
                                                    currentChatIndex=_game1Index+1;
                                                    whoSay=chatList[currentChatIndex]['sayer'];
                                                    msg = chatList[currentChatIndex]['value'];
                                                  });
                                                }else{
                                                  setState(() {
                                                    currentChatIndex=_game1Index-1;
                                                    whoSay=chatList[currentChatIndex]['sayer'];
                                                    msg = chatList[currentChatIndex]['value'];
                                                  });
                                                }

                                              },
                                            )));
                                        break;

                                      case 'game2':
                                        Navigator.push(context, PageTransition(
                                            type: PageTransitionType.fade,
                                            child: GameIndexScreen(
                                              episodeIndex: 2,
                                              onStartTap: () async{
                                                var result =  await Navigator.pushReplacement(context, PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child: Game2Screen()));

                                                if(result=='ok'){
                                                  setState(() {
                                                    currentChatIndex=_game2Index+1;
                                                    whoSay=chatList[currentChatIndex]['sayer'];
                                                    msg = chatList[currentChatIndex]['value'];
                                                  });
                                                }else{
                                                    setState(() {
                                                      currentChatIndex=_game2Index-1;
                                                      whoSay=chatList[currentChatIndex]['sayer'];
                                                      msg = chatList[currentChatIndex]['value'];
                                                    }
                                                  );
                                                }

                                              },
                                            )));
                                        break;

                                      case 'game3':

                                        Navigator.push(context, PageTransition(
                                            type: PageTransitionType.fade,
                                            child: GameIndexScreen(
                                              episodeIndex: 3,
                                              onStartTap: () async{
                                                var result =  await Navigator.pushReplacement(context, PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child: Game3Screen()));

                                                if(result=='ok'){
                                                  setState(() {
                                                    currentChatIndex=_game3Index+1;
                                                    whoSay=chatList[currentChatIndex]['sayer'];
                                                    msg = chatList[currentChatIndex]['value'];
                                                  });
                                                }else{
                                                  setState(() {
                                                    currentChatIndex=_game3Index-1;
                                                    whoSay=chatList[currentChatIndex]['sayer'];
                                                    msg = chatList[currentChatIndex]['value'];
                                                  });
                                                }

                                              },
                                            )));
                                        break;

                                      case 'game4':
                                        Navigator.push(context, PageTransition(
                                            type: PageTransitionType.fade,
                                            child: GameIndexScreen(
                                              episodeIndex: 4,
                                              onStartTap: () async{
                                                var result =  await Navigator.pushReplacement(context, PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child: Game4Screen()));

                                                if(result=='ok'){
                                                  setState(() {
                                                    currentChatIndex=_game4Index+1;
                                                    whoSay=chatList[currentChatIndex]['sayer'];
                                                    msg = chatList[currentChatIndex]['value'];
                                                  });
                                                }else if(result=='fail'){
                                                  currentChatIndex=_game4Index-1;
                                                  whoSay=chatList[currentChatIndex]['sayer'];
                                                  msg = chatList[currentChatIndex]['value'];
                                                }

                                              },
                                            )));
                                        break;

                                      case 'game5':
                                        Navigator.push(context, PageTransition(
                                            type: PageTransitionType.fade,
                                            child: GameIndexScreen(
                                              episodeIndex: 5,
                                              onStartTap: () async{
                                                var result =  await Navigator.pushReplacement(context, PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child: Game5Screen()));

                                                if(result=='ok'){
                                                  setState(() {
                                                    currentChatIndex=_game5Index+1;
                                                    whoSay=chatList[currentChatIndex]['sayer'];
                                                    msg = chatList[currentChatIndex]['value'];
                                                  });
                                                }else if(result=='fail'){
                                                  currentChatIndex=_game5Index-1;
                                                  whoSay=chatList[currentChatIndex]['sayer'];
                                                  msg = chatList[currentChatIndex]['value'];
                                                }

                                              },
                                            )));
                                        break;

                                    }
                                  }else{
                                    whoSay=chatList[currentChatIndex]['sayer'];
                                    msg = chatList[currentChatIndex]['value'];
                                  }

                                });
                              }
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
