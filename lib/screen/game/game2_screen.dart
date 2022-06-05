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


  bool found1 = true;
  bool found2 = true;
  bool found3 = true;
  bool found4 = true;



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
                  top: 135,
                  left: 55,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found1=true;
                        _check();
                      });
                      showToast('하인1 발견!');
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
                      showToast('하인2 발견!');
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
                      showToast('하인3 발견!');
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
                      showToast('하인4 발견!');
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
