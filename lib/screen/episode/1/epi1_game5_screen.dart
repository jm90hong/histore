import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:collection/collection.dart';



class Epi1Game5Screen extends StatefulWidget {
  @override
  _Epi1Game5ScreenState createState() => _Epi1Game5ScreenState();
}

class _Epi1Game5ScreenState extends State<Epi1Game5Screen> {
  

  var answerList=[1,2,4,3];
  var testList=[];
  int tapIndex=0;
  int num1=0;
  int num2=0;
  int num3=0;
  int num4=0;
  Function eq = const ListEquality().equals;


  void _compare(){
    print(testList.toString() +'  '+ answerList.toString());
    print(eq(testList,answerList));
    if(testList.length==4){

      if(eq(testList,answerList)){
        showToast('순서 일치!');
        Navigator.pop(context,true);
      }else{
        showToast('순서가 맞지 않습니다ㅠㅠ');
        Navigator.pop(context,false);
      }
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        _compare();
        if(testList.length!=4){
          Navigator.pop(context,false);
        }
        return true;
      },
      child: Scaffold(
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
                  CardWithNumberButton(
                      imagePath: 'assets/image/card3.png',
                      number: num3,
                      onTap: (){
                        setState(() {
                          tapIndex++;
                          num3=tapIndex;
                          testList.add(3);print(testList);
                          _compare();
                        });
                      },
                      isNumberVisible: num3==0?false:true
                  ),
                  SizedBox(width: 8,),
                  CardWithNumberButton(
                      imagePath: 'assets/image/card2.png',
                      number: num2,
                      onTap: (){
                        setState(() {
                          tapIndex++;
                          num2=tapIndex;
                          testList.add(2);print(testList);

                          _compare();
                        });
                      },
                      isNumberVisible: num2==0?false:true
                  ),
                  SizedBox(width: 8,),
                  CardWithNumberButton(
                      imagePath: 'assets/image/card1.png',
                      number: num1,
                      onTap: (){
                        setState(() {
                          tapIndex++;
                          num1=tapIndex;
                          testList.add(1);
                          print(testList);
                          _compare();
                        });
                      },
                      isNumberVisible: num1==0?false:true
                  ),
                  SizedBox(width: 8,),


                  SizedBox(width: 8,),
                  CardWithNumberButton(
                      imagePath: 'assets/image/card4.png',
                      number: num4,
                      onTap: (){
                        setState(() {
                          tapIndex++;
                          num4=tapIndex;
                          testList.add(4);print(testList);
                          _compare();
                        });
                      },
                      isNumberVisible: num4==0?false:true
                  ),
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}



class CardWithNumberButton extends StatelessWidget {

  bool isNumberVisible=false;
  int number=0;
  Function onTap;
  String imagePath;

  CardWithNumberButton({
    required this.imagePath,
    required this.number,
    required this.onTap,
    required this.isNumberVisible
  });


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
    return IgnorePointer(
      ignoring: isNumberVisible,
      child: GestureDetector(
        onTap: (){onTap();},
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(imagePath,width: 174,),
            Visibility(
              visible: isNumberVisible,
              child: Positioned(
                  top: 60,
                  child: _buildNumber(number)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
