
import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';

import '../../../model/game_result_model.dart';


//todo 북한군 찾기 게임
class Epi4Game2Screen extends StatefulWidget {
  const Epi4Game2Screen({Key? key}) : super(key: key);

  @override
  State<Epi4Game2Screen> createState() => _Epi4Game2ScreenState();
}

class _Epi4Game2ScreenState extends State<Epi4Game2Screen> {

  bool found1 = false;


  void _check() {
    if(found1){
      Provider.of<GameResultModel>(context,listen: false).makeGameComplete(gameType: 'game3');
      showToast('게임 성공!');
      Navigator.pop(context,true);
    }else{
      Navigator.pop(context,false);
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        _check();

        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
          imagePath: 'assets/image/episode4/epi4_game2_bg.jpg',
          child: Stack(
            children: [
              //todo 1
              Positioned(
                bottom: 10,
                right: 265,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      found1=true;
                      _check();
                    });
                    showToast('북한군 발견');
                  },
                  child: RedCircleBox(
                    size: 150,
                    isActive: found1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
