

import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';

import '../../game/game1_success_screen.dart';





//todo 광개토 대왕 유서 찾기
class Epi1Game1Screen extends StatefulWidget {
  @override
  _Epi1Game1ScreenState createState() => _Epi1Game1ScreenState();
}

class _Epi1Game1ScreenState extends State<Epi1Game1Screen> {

  bool found1 = false;
  bool found2 = false;
  bool found3 = false;
  bool found4 = false;


  //todo 계속 체크 하여 성공 여부 파단
  void _check() async{
    if(found1 && found2 && found3 && found4){
      Provider.of<GameResultModel>(context,listen: false).makeGameComplete(gameType: 'game1');
      showToast('게임 성공!');
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Game1SuccessScreen()),
      );
      Navigator.pop(context,true);
    }
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(found1 && found2 && found3 && found4){
          Navigator.pop(context,true);
        }else{
          Navigator.pop(context,false);
        }

        Provider.of<GameResultModel>(context,listen: false).refresh();
        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
          imagePath: 'assets/background/game1_bg.png',
          child: Stack(
            alignment: Alignment.center,
            children: [
              //todo 1
              Positioned(
                top: 135,
                left: 55,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found1=true;
                      _check();
                    });
                    showToast('문서1 발견!');
                  },
                  child: RedCircleBox(
                    size: 60,
                    isActive: found1,
                  ),
                ),
              ),

              //todo 1
              Positioned(
                top: 190,
                left: 120,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found2=true;
                      _check();

                    });
                    showToast('문서2 발견!');
                  },
                  child: RedCircleBox(
                    size: 60,
                    isActive: found2,
                  ),
                ),
              ),

              Positioned(
                bottom: 50,
                left: 330,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found3=true;
                      _check();
                    });
                    showToast('문서3 발견!');
                  },
                  child: RedCircleBox(
                    size: 60,
                    isActive: found3,
                  ),
                ),
              ),

              Positioned(
                bottom: 51,
                right: 20,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found4=true;
                      _check();

                    });
                    showToast('문서4 발견!');
                  },
                  child: RedCircleBox(
                    size: 60,
                    isActive: found4,
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
