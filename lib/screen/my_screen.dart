import 'package:flutter/material.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/screen/index_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'episode/1/episode_1_chat_screen.dart';
import 'episode/1/episode_1_epilogue_screen.dart';
import 'episode/2/episode_2_chat_screen.dart';
import 'episode/3/episode_3_chat_screen.dart';
import 'episode/4/episode_4_chat_screen.dart';


class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  int whichTab=0;

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
            SizedBox(height: 2,),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/image/duru.png',height: 270,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: 470,
                  height: 210,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/image/a.png',height: 196,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SimpleButton(
                                  imagePath : whichTab==0 ? 'assets/icon/btn_prof_e.png' : 'assets/icon/btn_prof_d.png',
                                  width : 100,
                                  onTap : (){
                                    setState(() {
                                      whichTab=0;
                                    });
                                  }
                              ),
                              SizedBox(width: 14,),
                              SimpleButton(
                                  imagePath : whichTab==1 ? 'assets/icon/btn_past_e.png' : 'assets/icon/btn_past_d.png',
                                  width : 100,
                                  onTap : (){
                                    setState(() {
                                      whichTab=1;
                                    });
                                  }
                              ),
                            ],
                          ),
                          const SizedBox(height: 12,),
                          whichTab==0 ? Container(
                            height: 120,
                            width: 260,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('대한',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 24,fontFamily: 'dx'),),
                                ),
                                const SizedBox(height: 30,),
                                Consumer<UserModel>(
                                    builder:(context, model, child){
                                      return  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _buildStageCard(model.me.epi1=='y' ? true :false,1),
                                          _buildStageCard(model.me.epi2=='y' ? true :false,2),
                                          _buildStageCard(model.me.epi3=='y' ? true :false,3),
                                          _buildStageCard(model.me.epi4=='y' ? true :false,4),
                                        ],
                                      );
                                    })
                              ],
                            ),
                          )
                          :
                          Container(
                            height: 120,
                            width: 260,
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
                          )

                        ],
                      )
                    ],
                  ),
                )
              ],
            )


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
          if(false){

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
          }
        },
        child: w
    );
  }


  Widget _buildStageCard(bool isClear,int episodeIndex){

    String path = '';
    if(episodeIndex==1){
      path='assets/icon/duru_sm.png';
    }else if(episodeIndex==2){
      path='assets/icon/ep2_icon.png';
    }else if(episodeIndex==3){
      path='assets/icon/ep3_icon.png';
    }else{
      path='assets/icon/ep4_icon.png';
    }

    double s = 50;
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: s,
      height: s,
      decoration: BoxDecoration(
        color: isClear ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(s/2),
        border: Border.all(color: isClear ? Color(0xffFAC200) : Colors.transparent,width: 3)
      ),
      child: Center(
        child: isClear ? Image.asset(path, height: 40,) : Image.asset('assets/icon/btn_lock.png', height: 40,) ,
      ),
    );
  }
}


