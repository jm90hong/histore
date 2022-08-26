import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';

class Epi2Game1Screen extends StatefulWidget {
  @override
  _Epi2Game1ScreenState createState() => _Epi2Game1ScreenState();
}

class _Epi2Game1ScreenState extends State<Epi2Game1Screen> {


  String aImg='assets/image/episode2/c1.png';
  String bImg='assets/image/episode2/c2.png';
  String msg1='';
  String msg2='';
  String msg3='';
  String _result='m';
  bool isGameSuccess=false;

  int _curIndex = 0;

  List<Map> msgs = [
    {
      'aImg':'assets/image/episode2/c9.png',
      'bImg':'assets/image/episode2/c1.png',
      'msg1':'명나라와 전쟁을 하면 좋지 않은 이유가 무엇이지?',
      'msg2':{'v':'작은나라가 큰 나라와 싸워 이기기는 어려워요.','a':true},
      'msg3':{'v':'명나라가 북원과 전쟁 중이라 고려의 군사가 더 많아요','a':false},
    },
    {
      'aImg':'assets/image/episode2/c9.png',
      'bImg':'assets/image/episode2/c1.png',
      'msg1':'수도 옮기는 게 쉬운 줄 알아? 평양으로 옮기면 분명 제대로 마련된 게 없어서 힘들 거다.',
      'msg2':{'v':'평양은 도로가 닦여 있어서 문제 없을 거예요.','a':false},
      'msg3':{'v':'평양은 넓은 평야가 있고 주변에 강이 있어서 경제,문화 모든 면에서 좋아요.','a':true},
    },
    {
      'aImg':'assets/image/episode2/c9.png',
      'bImg':'assets/image/episode2/c1.png',
      'msg1':'수도 옮기는 게 쉬운 줄 알아? 평양으로 옮기면 분명 제대로 마련된 게 없어서 힘들 거다.',
      'msg2':{'v':'평양은 도로가 닦여 있어서 문제 없을 거예요.','a':false},
      'msg3':{'v':'평양은 넓은 평야가 있고 주변에 강이 있어서 경제,문화 모든 면에서 좋아요.','a':true},
    },
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(isGameSuccess){
          Navigator.pop(context,true);
        }else{
          Navigator.pop(context,false);
        }
        Provider.of<GameResultModel>(context,listen: false).refresh();
        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
            imagePath: 'assets/image/episode2/bg2.png',
            child: Stack(
              alignment: Alignment.center,
              children: [
                //todo 이미지 a,b 넣기
                Positioned(
                  top: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('${msgs[_curIndex]['aImg']}',height: 390,),
                        Image.asset('${msgs[_curIndex]['bImg']}',height: 390,),
                      ],
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MsgBubble(
                      //onTap: (){},
                      text: msgs[_curIndex]['msg1'],
                    ),

                    const SizedBox(height: 50,),

                    Visibility(
                      visible: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset('assets/icon/vs.png',width: 130,),
                      ),
                    ),
                    MsgBubble(
                      onTap: (){
                        if(msgs[_curIndex]['msg2']['a']){
                          setState(() {
                            _result='y';
                          });
                        }else{
                          setState(() {
                            _result='n';
                          });
                        }
                      },
                      text: msgs[_curIndex]['msg2']['v'],
                    ),
                    const SizedBox(height: 8,),
                    MsgBubble(
                      onTap: (){

                        if(msgs[_curIndex]['msg3']['a']){
                          setState(() {
                            _result='y';
                          });
                        }else{
                          setState(() {
                            _result='n';
                          });
                        }
                      },
                      text: msgs[_curIndex]['msg3']['v'],
                    ),
                  ],
                ),


                if(_result=='y')
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/icon/circle.png',width: 300,),
                      SimpleButton(
                          imagePath: 'assets/icon/btn_next_stage.png',
                          width: 70,
                          onTap: (){

                            if(_curIndex+1==msgs.length){
                              isGameSuccess=true;
                              Navigator.pop(context,true);
                              showToast('게임1 성공');
                              Provider.of<GameResultModel>(context,listen: false).makeGameComplete(gameType: 'game4');
                            }else{
                              setState(() {
                                _curIndex++;
                                _result='m';
                              });
                            }



                          }
                      )
                    ],
                  )
                else if(_result=='n')
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/icon/close.png',width: 300,),
                      SimpleButton(
                          imagePath: 'assets/icon/btn_next_stage.png',
                          width: 70,
                          onTap: (){
                            showToast('게임4 실패 다음 기회에...');
                            Navigator.pop(context,false);
                          }
                      )
                    ],
                  ),
              ],
            )
        ),
      ),
    );
  }
}



class MsgBubble extends StatelessWidget {


  String text;
  Function onTap;

  MsgBubble({
    required this.text,
    this.onTap=v
  });


  static void v(){}


  double fs = 14;

  @override
  Widget build(BuildContext context) {

    if(text.length>30){
      fs=12;
    }

    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.brown,width: 3.2)
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            color: Color(0xff4B1200),
            fontSize: fs,
            fontWeight: FontWeight.normal,
            fontFamily: 'dx',
          ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}



