

import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';

import '../../game/game1_success_screen.dart';





//todo 광개토 대왕 유서 찾기
class Epi3Game2Screen extends StatefulWidget {
  @override
  _Epi3Game2ScreenState createState() => _Epi3Game2ScreenState();
}

class _Epi3Game2ScreenState extends State<Epi3Game2Screen> {

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
          imagePath: 'assets/image/episode3/bg7.jpg',
          child: Stack(
            alignment: Alignment.center,
            children: [
              //todo 1
              Positioned(
                top: 80,
                left: 153,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found1=true;
                      _check();
                    });
                    showToast('헤레본1 발견!');
                  },
                  child: RedCircleBox(
                    size: 60,
                    isActive: found1,
                  ),
                ),
              ),

              //todo 1
              Positioned(
                top: 110,
                left: 320,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found2=true;
                      _check();

                    });
                    showToast('헤레본2 발견!');
                  },
                  child: RedCircleBox(
                    size: 60,
                    isActive: found2,
                  ),
                ),
              ),

              Positioned(
                bottom: 110,
                left: 530,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found3=true;
                      _check();
                    });
                    showToast('헤레본3 발견!');
                  },
                  child: RedCircleBox(
                    size: 60,
                    isActive: found3,
                  ),
                ),
              ),

              Positioned(
                top: 79,
                right: 105,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found4=true;
                      _check();

                    });
                    showToast('헤레본4 발견!');
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
