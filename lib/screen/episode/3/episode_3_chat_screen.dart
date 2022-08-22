import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../model/game_result_model.dart';
import '../1/epi1_game4_screen.dart';
import '../1/epi1_game5_screen.dart';
import '../2/epi2_game3_screen.dart';
import '../game_intro_screen.dart';
import 'epi3_game1_screen.dart';
import 'epi3_game2_screen.dart';



class Episode3ChatScreen extends StatefulWidget {
  const Episode3ChatScreen({Key? key}) : super(key: key);

  @override
  State<Episode3ChatScreen> createState() => _Episode3ChatScreenState();
}

class _Episode3ChatScreenState extends State<Episode3ChatScreen> {






  //대화 중인 인물 이름의 태그 명시
  bool isLeft=true;
  String a = "대한";
  String b = "장수왕";
  String? whoSay = '대한';
  String? msg='';
  String? aImg='';
  String? bImg='';
  String backgroundImg='';
  int currentChatIndex=0;
  List<Map> chatList = [];
  bool game1Success=false;
  bool game2Success=false;
  bool game3Success=false;
  bool game4Success=false;
  bool game5Success=false;
  bool game6Success=false;




  void _setUiByChatIndex(){
    setState(() { // setState() 추가.
      isLeft=chatList[currentChatIndex]['isLeft'];
      whoSay=chatList[currentChatIndex]['sayer'];
      msg=chatList[currentChatIndex]['value'];
      aImg = chatList[currentChatIndex]['a_img'];
      bImg = chatList[currentChatIndex]['b_img'];
      backgroundImg = chatList[currentChatIndex]['background_img'];
    });
  }


  void _judgement({required String gameName, required bool isSuccess}){

    if(game1Success && game2Success && game3Success){
      showToast('에피소드 2 성공');
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
                      episodeIndex: 3,
                      gameIndex: 1,
                      bgPath: 'assets/image/episode3/bg6.png',
                    )
                )
            );



            if(result1){
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Epi3Game1Screen()
                  )
              );
              game1Success=result;
              _judgement(gameName: 'game1',isSuccess: game1Success);
            }

            break;
          case 'game2':

            var result1 = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: GameIntroScreen(
                      episodeIndex: 3,
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
                      child: Epi3Game2Screen()
                  )
              );
              game2Success=result;
              _judgement(gameName: 'game2',isSuccess: game2Success);
            }


            break;
          case 'game3':
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Epi2Game3Screen()
                )
            );
            game3Success=result;
            _judgement(gameName: 'game3',isSuccess: game3Success);
            break;
          case 'game4':
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Epi1Game4Screen()
                )
            );
            game4Success=result;
            _judgement(gameName: 'game4',isSuccess: game4Success);
            break;
          case 'game5':
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Epi1Game5Screen()
                )
            );
            game5Success=result;
            _judgement(gameName: 'game5',isSuccess: game5Success);
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
        'a_img':'assets/image/episode2/c1.png',
        'b_img':'assets/image/episode2/c8.png',
        'background_img':'assets/image/episode3/bg5.jpg',
      },
      {
        'isLeft':false,
        'sayer':'치치',
        'value':'대화1-2',
        'a_img':'assets/image/episode2/c1.png',
        'b_img':'assets/image/episode2/c8.png',
        'background_img':'assets/image/episode3/bg5.jpg',
      },
      {
        'sayer':'game',
        'value':'game1',

      },
      {
        'isLeft':true,
        'sayer':'대한',
        'value':'대화2-1',
        'a_img':'assets/image/episode2/c1.png',
        'b_img':'assets/image/episode2/c8.png',
        'background_img':'assets/image/episode3/bg5.jpg',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'대화2-2',
        'a_img':'assets/image/episode2/c1.png',
        'b_img':'assets/image/episode2/c8.png',
        'background_img':'assets/image/episode3/bg5.jpg',
      },
      {
        'sayer':'game',
        'value':'game2',
      },
      {
        'isLeft':true,
        'sayer':'대한',
        'value':'대화3-1',
        'a_img':'assets/image/episode2/c1.png',
        'b_img':'assets/image/episode2/c8.png',
        'background_img':'assets/image/episode3/bg5.jpg',
      },
      {
        'isLeft':false,
        'sayer':'장수왕',
        'value':'대화3-2',
        'a_img':'assets/image/episode2/c1.png',
        'b_img':'assets/image/episode2/c8.png',
        'background_img':'assets/image/episode3/bg5.jpg',
      },
      {
        'sayer':'game',
        'value':'game3',
      },
      {
        'isLeft':true,
        'sayer':'장수왕',
        'value':'모든 게임을 성공하였군 에피소드2를 종료',
        'a_img':'assets/image/episode2/c1.png',
        'b_img':'assets/image/episode2/c8.png',
        'background_img':'assets/image/episode3/bg5.jpg',
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
            children: [
              whoSay != 'game' ? Positioned(
                  bottom: -50,
                  left: 120,
                  child: Image.asset('$aImg',width: 170,fit: BoxFit.cover,)
              ) : const SizedBox(width: 0,height: 0,),

              whoSay != 'game' ? Positioned(
                  bottom: -50,
                  right: 120,
                  child: Image.asset('$bImg',width: 140,fit: BoxFit.cover,)
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
          )
      ),
    );
  }
}
