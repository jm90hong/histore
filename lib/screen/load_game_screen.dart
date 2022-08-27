import 'package:flutter/material.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/screen/episode/1/episode_1_chat_screen.dart';
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
            Expanded(
              child: SingleChildScrollView(
                child:Consumer<UserModel>(
                  builder: (context, userModel, child){
                    return Column(
                      children: ,
                    );
                  },
                )
              ),
            ))
          ],
        ),
      ),
    );
  }



  Widget _buildGameloadCard({required int episodeIndex, required bool isOpen,required Function onTap}){

    Widget w = Text('');

    if(episodeIndex==1){
      if(isOpen){
        w= Image.asset('assets/icon/gamelaod_1_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gamelaod_1_lock.png',width: 400,);
      }
    }else if(episodeIndex==2){
      if(isOpen){
        w= Image.asset('assets/icon/gamelaod_2_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gamelaod_2_lock.png',width: 400,);
      }
    }else if(episodeIndex==3){
      if(isOpen){
        w= Image.asset('assets/icon/gamelaod_3_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gamelaod_3_lock.png',width: 400,);
      }
    }else{
      if(isOpen){
        w= Image.asset('assets/icon/gamelaod_4_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gamelaod_4_lock.png',width: 400,);
      }
    }


    return w;
  }



}





