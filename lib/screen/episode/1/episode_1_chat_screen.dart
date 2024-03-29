import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/screen/episode/game_intro_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'epi1_game1_screen.dart';
import 'epi1_game2_screen.dart';
import 'epi1_game3_screen.dart';
import 'epi1_game4_screen.dart';
import 'epi1_game5_screen.dart';
import 'epi1_game6_screen.dart';


class Episode1ChatScreen extends StatefulWidget {


  @override
  _Episode1ChatScreenState createState() => _Episode1ChatScreenState();
}

class _Episode1ChatScreenState extends State<Episode1ChatScreen> {

  bool isLeft=true;
  String a = "대한";
  String b = "장수왕";
  String? whoSay = '대한';
  String? msg='';
  String? aImg='';
  String? bImg='';
  String birdImg='';
  String backgroundImg='';
  int currentChatIndex=0;
  List<Map> chatList = [];
  bool epi1Game1Success=false;
  bool epi1Game2Success=false;
  bool epi1Game3Success=false;
  bool epi1Game4Success=false;
  bool epi1Game5Success=false;
  bool epi1Game6Success=false;

  void _setUiByChatIndex(){
    setState(() { // setState() 추가.
      whoSay=chatList[currentChatIndex]['sayer'];
      msg=chatList[currentChatIndex]['value'];
      aImg = chatList[currentChatIndex]['a_img'];
      bImg = chatList[currentChatIndex]['b_img'];
      birdImg = chatList[currentChatIndex]['bird_img'];
      backgroundImg = chatList[currentChatIndex]['background_img'];
    });
  }


  void _judgement({required String gameName, required bool isSuccess}){

    if(epi1Game1Success && epi1Game2Success && epi1Game3Success && epi1Game4Success && epi1Game5Success){
      showToast('에피소드 1 성공');
      //Navigator.pop(context,true);
      _goToChatAfterTheGame(gameName: gameName);
      return;
    }

    if(isSuccess){
      _goToChatAfterTheGame(gameName: gameName);
    }else{
      _goToChatBeforeTheGame(gameName: gameName);
    }
  }

  void _goToChatBeforeTheGame({required String gameName}){
    var index = chatList.indexWhere((element) => element['value']==gameName);
    currentChatIndex=index-1;
    _setUiByChatIndex();
  }

  void _goToChatAfterTheGame({required String gameName}){
    var index = chatList.indexWhere((element) => element['value']==gameName);
    currentChatIndex=index+1;
    _setUiByChatIndex();
  }

  void goNextChat() async{
    currentChatIndex++;
    if(chatList[currentChatIndex]['sayer'] != 'game'){
      _setUiByChatIndex();
    }else{
      if(chatList[currentChatIndex]['sayer']=='game'){
        //todo game screen으로 이동
        switch(chatList[currentChatIndex]['value']){
          case 'game1':




            var result1 = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: GameIntroScreen(
                      episodeIndex: 1,
                      gameIndex: 1,
                      bgPath: 'assets/image/episode2/bg1.png',
                    )
                )
            );

            if(result1){
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Epi1Game1Screen()
                  )
              );
              epi1Game1Success=result;
              _judgement(gameName: 'game1',isSuccess: epi1Game1Success);
            }


            break;
          case 'game2':


            var result1 = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: GameIntroScreen(
                      episodeIndex: 1,
                      gameIndex: 2,
                      bgPath: 'assets/image/episode2/bg1.png',
                    )
                )
            );

            if(result1){
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Epi1Game2Screen()
                  )
              );
              epi1Game2Success=result;
              _judgement(gameName: 'game2',isSuccess: epi1Game2Success);
            }


            break;
          case 'game3':

            var result1 = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: GameIntroScreen(
                      episodeIndex: 1,
                      gameIndex: 3,
                      bgPath: 'assets/image/episode2/bg1.png',
                    )
                )
            );

            if(result1){
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Epi1Game3Screen()
                  )
              );
              epi1Game3Success=result;
              _judgement(gameName: 'game3',isSuccess: epi1Game3Success);
            }


            break;
          case 'game4':

            var result1 = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: GameIntroScreen(
                      episodeIndex: 1,
                      gameIndex: 4,
                      bgPath: 'assets/image/episode2/bg1.png',
                    )
                )
            );


            if(result1){
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Epi1Game4Screen()
                  )
              );

              epi1Game4Success=result;
              _judgement(gameName: 'game4',isSuccess: epi1Game4Success);
            }

            break;
          case 'game5':
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Epi1Game5Screen()
                )
            );
            epi1Game5Success=result;
            _judgement(gameName: 'game5',isSuccess: epi1Game5Success);
            break;
          case 'end':
            Navigator.pop(context,true);
            break;
        }
      }
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList=[
      {
        'isLeft':true,
        'sayer':'대한',
        'value':'대화1-1',
        'a_img':'assets/image/episode1/d_basic.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/image/episode1/bg9.jpg',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'대화1-2',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/image/episode1/bg9.jpg',
      },
      {
        'sayer':'game',
        'value':'game1',

      },
      {
        'isLeft':true,
        'sayer':'대한',
        'value':'대화2-1',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'대화2-2',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'sayer':'game',
        'value':'game2',
      },
      {
        'isLeft':true,
        'sayer':'대한',
        'value':'대화3-1',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'대화3-2',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'sayer':'game',
        'value':'game3',
      },
      {
        'isLeft':true,
        'sayer':'대한',
        'value':'대화4-1',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'대화4-2',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'sayer':'game',
        'value':'game4',
      },
      {
        'isLeft':true,
        'sayer':'대한',
        'value':'대화5-1',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'대화5-2',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'sayer':'game',
        'value':'game5',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'모든 게임을 성공하였군 에피소드1을 종료',
        'a_img':'assets/image/episode1/d_angrycry.png',
        'b_img':'assets/image/episode1/b.png',
        'bird_img':'assets/image/episode1/c_basic.png',
        'background_img':'assets/background/bg4.png',
      },
      {
        'sayer':'game',
        'value':'end',
      },
    ];
    _setUiByChatIndex();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: backgroundImg,
        child: Stack(
          alignment: Alignment.center,
          children: [ //todo 캐릭터

            //todo 새 이미지 c_로 시작하는 이미지
            whoSay != 'game' ? Positioned(
                top: 40,
                left: 275,
                child: Image.asset(birdImg,width: 100,fit: BoxFit.cover,)
            ) : const SizedBox(width: 0,height: 0,),

            whoSay != 'game' ? Positioned(
                bottom: -50,
                left: 120,
                child: Image.asset('$aImg',width: 170,fit: BoxFit.cover,)
            ) : const SizedBox(width: 0,height: 0,),





            whoSay != 'game' ? Positioned(
                bottom: -50,
                right: 120,
                child: Image.asset('$bImg',width: 170,fit: BoxFit.cover,)
            ) : const SizedBox(width: 0,height: 0,),

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
                        child: Text(msg!),
                      ),
                    ),

                    Positioned(
                      top: 5,
                      left: isLeft ? 30 : null,
                      right: !isLeft ? 30 : null,
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
                            whoSay!,
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
                                goNextChat();
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
