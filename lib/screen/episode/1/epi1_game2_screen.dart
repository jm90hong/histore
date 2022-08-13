import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/screen/game/game1_success_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';



class Epi1Game2Screen extends StatefulWidget {
  @override
  _Epi1Game2ScreenState createState() => _Epi1Game2ScreenState();
}

class _Epi1Game2ScreenState extends State<Epi1Game2Screen> {


  bool found1 = false;


  void _check() {
    if(found1){
      Provider.of<GameResultModel>(context,listen: false).makeGameComplete(gameType: 'game2');
      showToast('게임 성공!');
      Navigator.pop(context,true);
    }

  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async{
        if(found1){
          Navigator.pop(context,true);
        }else{
          Navigator.pop(context,false);
        }
        Provider.of<GameResultModel>(context,listen: false).refresh();
        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
            imagePath: 'assets/background/game2_bg.jpg',
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 120,
                  left: 440,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        found1=true;
                        _check();
                      });
                      showToast('직속 하인 발견!');
                    },
                    child: RedCircleBox(
                      size: 130,
                      isActive: found1,
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
