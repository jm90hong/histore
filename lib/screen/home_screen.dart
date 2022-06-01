
import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';

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
                        imagePath: 'assets/icon/btn_profile.png',
                        width: 50,
                        onTap: (){
                          //프로필 보기
                        }
                    ),


                  ],
                ),
              ),
              Image.asset('assets/icon/epi1.png',width: 140,),
              Row(
                children: [

                ],
              )
              
            ],
          ),
        ),
      )
    );
  }
}



Widget buildGameStageCard(){
  return Container(
    margin: EdgeInsets.only(right: 12),
    width: 100,
    height: 100,

  );
}