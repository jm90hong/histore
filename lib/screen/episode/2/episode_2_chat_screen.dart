import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../widget/app_widget.dart';
import '../1/epi1_game1_screen.dart';
import '../1/epi1_game2_screen.dart';
import '../1/epi1_game3_screen.dart';
import '../1/epi1_game4_screen.dart';
import '../1/epi1_game5_screen.dart';

class Episode2ChatScreen extends StatefulWidget {
  const Episode2ChatScreen({Key? key}) : super(key: key);

  @override
  State<Episode2ChatScreen> createState() => _Episode2ChatScreenState();
}

class _Episode2ChatScreenState extends State<Episode2ChatScreen> {

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
      whoSay=chatList[currentChatIndex]['sayer'];
      msg=chatList[currentChatIndex]['value'];
      aImg = chatList[currentChatIndex]['a_img'];
      bImg = chatList[currentChatIndex]['b_img'];
      backgroundImg = chatList[currentChatIndex]['background_img'];
    });
  }


  void _judgement({required String gameName, required bool isSuccess}){

    if(game1Success && game2Success && game3Success && game4Success && game5Success){
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
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Epi1Game1Screen()
                )
            );
            game1Success=result;
            _judgement(gameName: 'game1',isSuccess: game1Success);
            break;
          case 'game2':
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Epi1Game2Screen()
                )
            );
            game2Success=result;
            _judgement(gameName: 'game2',isSuccess: game2Success);
            break;
          case 'game3':
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Epi1Game3Screen()
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
  Widget build(BuildContext context) {
    return Container();
  }
}
