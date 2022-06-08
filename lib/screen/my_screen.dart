import 'package:flutter/material.dart';
import 'package:histore/screen/index_screen.dart';
import 'package:histore/widget/app_widget.dart';


class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
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
            SizedBox(height: 20,),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/image/duru.png',height: 280,),
                Container(
                  width: 500,
                  height: 210,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Image.asset('assets/image/a.png')
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icon/btn_prof_e.png',width: 100,)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text('대한',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 24,fontFamily: 'dx'),),
                          SizedBox(height: 35,),
                          Row(
                            children: [
                              _buildStageCard(),
                              _buildStageCard(),
                              _buildStageCard(),
                              _buildStageCard(),
                            ],
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


  Widget _buildStageCard(){
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}


