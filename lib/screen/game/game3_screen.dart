

import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';

class Game3Screen extends StatefulWidget {
  @override
  _Game3ScreenState createState() => _Game3ScreenState();
}

class _Game3ScreenState extends State<Game3Screen> {

  bool found1 = true;
  bool found2 = true;

  void _check() {
    if(found1 && found2){
      Provider.of<GameResultModel>(context,listen: false).makeGameComplete(gameType: 'game3');
      showToast('게임 성공!');
      Navigator.pop(context,"ok");
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,"ok");
        Provider.of<GameResultModel>(context,listen: false).refresh();
        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
            imagePath: 'assets/background/bg1.png',
            child: Stack(
              alignment: Alignment.center,
              children: [
                //todo 1
                Positioned(
                  bottom: 20,
                  right: 60,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found1=true;
                        _check();
                      });
                      showToast('평야 발견!');
                    },
                    child: RedCircleBox(
                      size: 250,
                      isActive: found1,
                    ),
                  ),
                ),

                //todo 1
                Positioned(
                  bottom: 70,
                  left: 10,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found2=true;
                        _check();
                      });
                      showToast('강 발견!');
                    },
                    child: RedCircleBox(
                      size: 240,
                      isActive: found2,
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
