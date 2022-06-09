import 'package:flutter/material.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/screen/index_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';


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
                                          _buildStageCard(model.me.epi1=='y' ? true :false),
                                          _buildStageCard(model.me.epi2=='y' ? true :false),
                                          _buildStageCard(model.me.epi3=='y' ? true :false),
                                          _buildStageCard(model.me.epi4=='y' ? true :false),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/icon/jangsu1.png',width: 210,),
                                  SizedBox(height: 5,),
                                  Image.asset('assets/icon/lock2.png',width: 210,),
                                  SizedBox(height: 5,),
                                  Image.asset('assets/icon/lock2.png',width: 210,),
                                  SizedBox(height: 5,),
                                  Image.asset('assets/icon/lock2.png',width: 210,),
                                ],
                              ),
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



  Widget _buildStageCard(bool isClear){
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
        child: isClear ? Image.asset('assets/icon/duru_sm.png', height: 40,) : Image.asset('assets/icon/btn_lock.png', height: 40,) ,
      ),
    );
  }
}


