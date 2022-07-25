
import 'package:flutter/material.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/screen/chat_screen.dart';
import 'package:histore/screen/episode/1/episode_1_epilogue_screen.dart';
import 'package:histore/screen/game_index_screen.dart';
import 'package:histore/screen/load_game_screen.dart';
import 'package:histore/screen/my_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'episode/1/episode_1_chat_screen.dart';
import 'episode_index_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/bg2.png',
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SimpleButton(
                        imagePath: 'assets/icon/btn_file.png',
                        width: 50,
                        onTap: (){
                          //프로필 보기
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoadGameScreen()));
                        }
                    ),
                    SizedBox(width: 16,),
                    SimpleButton(
                        imagePath: 'assets/icon/btn_profile.png',
                        width: 50,
                        onTap: (){
                          //프로필 보기
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MyScreen()));
                        }
                    ),
                  ],
                ),
              ),
              Image.asset('assets/icon/epi1.png',width: 140,),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,

                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Consumer<UserModel>(
                    builder: (context, userModel, child){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildGameStageCard(
                              episodeIndex: 1,
                              gameName: '장수와의 평양천도',
                              isOpen: userModel.me.epi1 == 'y' ? true : false,
                          ),
                          buildGameStageCard(
                              episodeIndex: 2,
                              gameName: '이성계의 회군',
                              isOpen:  userModel.me.epi2 == 'y' ? true : false
                          ),
                          buildGameStageCard(
                              episodeIndex: 3,
                              gameName: '임진왜란',
                              isOpen:  userModel.me.epi3 == 'y' ? true : false
                          ),
                          buildGameStageCard(
                              episodeIndex: 4,
                              gameName: '을지문덕 대전투',
                              isOpen:  userModel.me.epi4 == 'y' ? true : false
                          ),
                        ],
                      );
                    },
                  )
                ),
              )
              
            ],
          ),
        ),
      )
    );
  }



  Widget buildGameStageCard({
    required int episodeIndex,
    required bool isOpen,
    required String gameName

  }){

    TextStyle ts1 = const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal,fontFamily: 'dx');


    return GestureDetector(
      onTap: () async{
        if(isOpen){
          showToast('$gameName 에 입장 합니다.');
          if(episodeIndex==1){
            var result = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Episode1EpilogueScreen()
                )
            );

            if(result=='ok'){
              print('에피1 성공');
              //todo 에피소드 1 시작하기
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Episode1ChatScreen()
                  )
              );
            }
          }else if(episodeIndex==2){

          }else if(episodeIndex==3){

          }else if(episodeIndex==4){

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
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isOpen ? Color(0xfff39a1a) : Colors.grey,
            borderRadius: BorderRadius.circular(10)
        ),
        width: 180,
        height: 210,

        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset('assets/background/epi1.png',width: 150,height: 150,fit: BoxFit.cover,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(!isOpen ? 0.55 : 0.0),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  !isOpen ? Image.asset('assets/icon/btn_lock.png',width: 40,) : const Text('')
                ],

              ),
            ),
            const SizedBox(height: 12,),
            Text(gameName,style: ts1,)
          ],
        ),
      ),
    );
  }
}



