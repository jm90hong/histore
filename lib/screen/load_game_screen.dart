import 'package:flutter/material.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/screen/episode/1/episode_1_chat_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'chat_screen.dart';
import 'episode/1/episode_1_epilogue_screen.dart';
import 'episode/2/episode_2_chat_screen.dart';
import 'episode/3/episode_3_chat_screen.dart';
import 'episode/4/episode_4_chat_screen.dart';





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
            const Text('게임로드',style: TextStyle(color: Color(0xffCF5E00),fontFamily: 'dx',fontSize: 24),),
            const SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child:Consumer<UserModel>(
                  builder: (context, userModel, child){
                    return Column(
                      children: [
                        _buildGameloadCard(
                            episodeIndex: 1,
                            isOpen: userModel.me.epi1=='y' ? true : false
                        ),
                        const SizedBox(height: 10,),
                        _buildGameloadCard(
                            episodeIndex: 2,
                            isOpen: userModel.me.epi2=='y' ? true : false
                        ),
                        const SizedBox(height: 10,),
                        _buildGameloadCard(
                            episodeIndex: 3,
                            isOpen: userModel.me.epi3=='y' ? true : false
                        ),
                        const SizedBox(height: 10,),
                        _buildGameloadCard(
                            episodeIndex: 4,
                            isOpen: userModel.me.epi4=='y' ? true : false
                        ),


                      ],
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildGameloadCard({required int episodeIndex, required bool isOpen}){

    Widget w = Text('');

    if(episodeIndex==1){
      if(isOpen){
        w= Image.asset('assets/icon/gameload_1_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gameload_1_lock.png',width: 400,);
      }
    }else if(episodeIndex==2){
      if(isOpen){
        w= Image.asset('assets/icon/gameload_2_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gameload_2_lock.png',width: 400,);
      }
    }else if(episodeIndex==3){
      if(isOpen){
        w= Image.asset('assets/icon/gameload_3_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gameload_3_lock.png',width: 400,);
      }
    }else{
      if(isOpen){
        w= Image.asset('assets/icon/gameload_4_unlock.png',width: 400,);
      }else{
        w= Image.asset('assets/icon/gameload_4_lock.png',width: 400,);
      }
    }


    return GestureDetector(
        onTap: () async{
          if(isOpen){

            if(episodeIndex==1){
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Episode1EpilogueScreen()
                  )
              );

              if(result=='ok'){
                //todo 에피소드 1 시작하기
                var result = await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: Episode1ChatScreen()
                    )
                );


                if(result){
                  Provider.of<UserModel>(context,listen: false).clearStage(stage: 'stage2');
                }

              }
            }else if(episodeIndex==2){

              //todo 에피소드 2 시작하기
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Episode2ChatScreen()
                  )
              );
              if(result){
                //todo episode2 성공 처리
                Provider.of<UserModel>(context,listen: false).clearStage(stage: 'stage3');
              }

            }else if(episodeIndex==3){

              //todo 에피소드 3 시작하기
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Episode3ChatScreen()
                  )
              );

              if(result){
                //todo episode3 성공 처리
                Provider.of<UserModel>(context,listen: false).clearStage(stage: 'stage4');
              }

            }else if(episodeIndex==4){
              //todo 에피소드 4 시작하기
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Episode4ChatScreen()
                  )
              );


            }




            // Navigator.push(context, PageTransition(type: PageTransitionType.fade,
            //     child: EpisodeIndexScreen(
            //       episodeIndex: episodeIndex,
            //       onStartTap: () async {
            //         var result = await Navigator.pushReplacement(
            //             context,
            //             PageTransition(
            //                 type: PageTransitionType.fade,
            //                 child: ChatScreen()
            //             )
            //         );
            //
            //         //todo 에피소드 2 성공 처리 하기
            //         // if(result=='ok'){
            //         //   Provider.of<UserModel>(context,listen: false).clearStage(
            //         //       stage: 'stage2'
            //         //   );
            //         // }else{
            //         //
            //         // }
            //       },
            //     ))
            // );
          }else{
            showToast('이전 단계의 게임을 완료 후 입장해주세요.');
          }
        },
        child: w
    );
  }



}





