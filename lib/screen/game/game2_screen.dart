import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/screen/game/game1_success_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';



class Game2Screen extends StatefulWidget {
  @override
  _Game2ScreenState createState() => _Game2ScreenState();
}

class _Game2ScreenState extends State<Game2Screen> {


  bool found1 = false;
  bool found2 = false;
  bool found3 = false;
  bool found4 = false;



  void _check() {
    if(found1 && found2 && found3 && found4){
      Provider.of<GameResultModel>(context,listen: false).makeGameComplete(gameType: 'game2');
      showToast('게임 성공!');
      Navigator.pop(context,"ok");
    }

  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,"ok");
        Provider.of<GameResultModel>(context,listen: false).refresh();
        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
            imagePath: 'assets/background/game2_bg.jpg',
            child: Stack(
              alignment: Alignment.center,
              children: [
                //todo 1
                Positioned(
                  top: 182,
                  left: 155,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found1=true;
                        _check();
                      });
                      showToast('하인1 발견!');
                    },
                    child: RedCircleBox(
                      size: 120,
                      isActive: found1,
                    ),
                  ),
                ),

                //todo 1
                Positioned(
                  top: 45,
                  left: 380,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found2=true;
                        _check();
                      });
                      showToast('하인2 발견!');
                    },
                    child: RedCircleBox(
                      size: 100,
                      isActive: found2,
                    ),
                  ),
                ),

                Positioned(
                  top: 120,
                  left: 440,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found3=true;
                        _check();
                      });
                      showToast('하인3 발견!');
                    },
                    child: RedCircleBox(
                      size: 130,
                      isActive: found3,
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  right: 12,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found4=true;
                        _check();
                      });
                      showToast('하인4 발견!');
                    },
                    child: RedCircleBox(
                      size: 130,
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
