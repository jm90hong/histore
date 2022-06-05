import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/screen/game/game2_screen.dart';
import 'package:histore/screen/game_index_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'game/game1_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  String a = "대한";
  String b = "장수왕";
  String whoSay = '대한';
  int currentChatIndex=0;
  String msg='';
  bool isStartGame=false;



  List<Map> chatList = [];

  int _game1Index=5;
  int _game2Index=10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList = [
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
        'value':'대화2-14'
      },
      {
        'sayer':'game',
        'value':'game2'
      },
      {
        'sayer':b,
        'value':'오 대단하군.. 게임2을 성공했구나!'
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/duru.png')
                          )
                        ),
                        child: Center(
                          child: Text(
                            whoSay,
                            style: TextStyle(
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
                                                var result= await Navigator.pushReplacement(context, PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child: Game1Screen()
                                                ));
                                                if(result=='ok'){
                                                  setState(() {
                                                    currentChatIndex=_game1Index;
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
                                              episodeIndex: 1,
                                              onStartTap: () async{
                                               var result =  await Navigator.pushReplacement(context, PageTransition(
                                                    type: PageTransitionType.fade,
                                                    child: Game2Screen()));


                                              },
                                            )));
                                        break;

                                      case 'game3':
                                        break;

                                      case 'game4':
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
