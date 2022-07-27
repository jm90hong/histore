

import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';

class Epi1Game3Screen extends StatefulWidget {
  @override
  _Epi1Game3ScreenState createState() => _Epi1Game3ScreenState();
}

class _Epi1Game3ScreenState extends State<Epi1Game3Screen> {

  bool found1 = false;
  bool found2 = false;

  void _check() {
    if(found1 && found2){
      Provider.of<GameResultModel>(context,listen: false).makeGameComplete(gameType: 'game3');
      showToast('게임 성공!');
      Navigator.pop(context,true);
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(found1 && found2){
          Navigator.pop(context,true);
        }else{
          Navigator.pop(context,false);
        }

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
