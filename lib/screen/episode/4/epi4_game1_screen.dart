import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';

import '../../../model/game_result_model.dart';



class Epi4Game1Screen extends StatefulWidget {
  const Epi4Game1Screen({Key? key}) : super(key: key);

  @override
  State<Epi4Game1Screen> createState() => _Epi4Game1ScreenState();
}

class _Epi4Game1ScreenState extends State<Epi4Game1Screen> {

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
      'aImg':'assets/image/episode4/c6.png',
      'bImg':'assets/image/episode4/c8.png',
      'msg1':'우리가 무엇을 도와주면 되는가?',
      'msg2':{'v':'대한민국에 있는 미군들이 위헙합니다. 연합군을 보내주세요','a':true},
      'msg3':{'v':'대한민국에 있는 미군들이 위험해 미군들만 미국으로 보내주세요','a':false},
      'msg4':{'v':'미국의 명성이 높아질 기회입니다.','a':false},
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
            imagePath: 'assets/background/bg5.png',
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

                    const SizedBox(height: 10,),

                    Visibility(
                      visible: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset('assets/icon/vs.png',width: 100,),
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
                    const SizedBox(height: 8,),
                    MsgBubble(
                      onTap: (){

                        if(msgs[_curIndex]['msg4']['a']){
                          setState(() {
                            _result='y';
                          });
                        }else{
                          setState(() {
                            _result='n';
                          });
                        }
                      },
                      text: msgs[_curIndex]['msg4']['v'],
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
                            showToast('게임1 실패 다음 기회에...');
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



