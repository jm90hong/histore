import 'package:flutter/material.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'chat_screen.dart';




class LoadGameScreen extends StatefulWidget {

  @override
  _LoadGameScreenState createState() => _LoadGameScreenState();
}

class _LoadGameScreenState extends State<LoadGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/bg2.png',
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleButton(
                      imagePath : 'assets/icon/btn_home.png',
                      width : 50,
                      onTap : (){
                        Navigator.pop(context);
                      }
                  ),
                ],
              ),
            ),
            Text('게임로드',style: TextStyle(color: Color(0xffCF5E00),fontFamily: 'dx',fontSize: 24),),
            SizedBox(height: 20,),
            Expanded(child: SingleChildScrollView(
              child: Column(children: [
                GestureDetector(
                    onTap: () async{
                      var result = await Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: ChatScreen()));
                      //todo 에피소드 2 성공 처리 하기
                      if(result=='ok'){
                        Provider.of<UserModel>(context,listen: false).clearStage(
                            stage: 'stage2'
                        );

                      }else{

                      }
                    },
                    child: Image.asset('assets/icon/jangsu1.png',width: 400,)
                ),
                SizedBox(height: 10,),
                Image.asset('assets/icon/lock2.png',width: 400,),
                SizedBox(height: 10,),
                Image.asset('assets/icon/lock2.png',width: 400,),
                SizedBox(height: 10,),
                Image.asset('assets/icon/lock2.png',width: 400,),
              ],),
            ))
          ],
        ),
      ),
    );
  }
}
