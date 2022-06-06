import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';




class Game5Screen extends StatefulWidget {
  @override
  _Game5ScreenState createState() => _Game5ScreenState();
}

class _Game5ScreenState extends State<Game5Screen> {
  
  
  Widget _buildNumber(int number){
    
    
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        border: Border.all(color:Colors.brown,width: 3),
        borderRadius: BorderRadius.circular(40)
      ),
      child: Center(
        child: Text('$number',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'dx'),),
      ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/bg2.png',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('최종 추리',style: TextStyle(color: Colors.white,fontFamily: 'dx',fontWeight: FontWeight.normal,fontSize: 25),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/image/card1.png',width: 174,),
                    Positioned(
                        top: 60,
                        child: _buildNumber(1)
                    ),
                  ],
                ),
                SizedBox(width: 8,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/image/card2.png',width: 174,),
                    Positioned(
                        top: 60,
                        child: _buildNumber(2)
                    ),
                  ],
                ),
                SizedBox(width: 8,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/image/card3.png',width: 174,),
                    Positioned(
                        top: 60,
                        child: _buildNumber(3)
                    ),
                  ],
                ),
                SizedBox(width: 8,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/image/card4.png',width: 174,),
                    Positioned(
                        top: 60,
                        child: _buildNumber(4)
                    ),
                  ],
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}

