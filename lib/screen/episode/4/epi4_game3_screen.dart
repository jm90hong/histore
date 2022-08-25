
import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:collection/collection.dart';

class Epi4Game3Screen extends StatefulWidget {
  const Epi4Game3Screen({Key? key}) : super(key: key);

  @override
  _Epi4Game3ScreenState createState() => _Epi4Game3ScreenState();
}

class _Epi4Game3ScreenState extends State<Epi4Game3Screen> {

  int _i=0;
  var answerList=[1, 4, 2, 3];
  var testList=[];
  int tapIndex=0;
  int num1=0;
  int num2=0;
  int num3=0;
  int num4=0;

  bool success1=false;
  bool success2=false;
  Function eq = const ListEquality().equals;


  void _checkSuccess(){
    if(success1 && success2){
      Navigator.pop(context,true);
    }else{
      Navigator.pop(context,false);
    }
  }

  void _compare(){
    print(testList.toString() +'  '+ answerList.toString());
    print(eq(testList,answerList));
    if(testList.length==4){
      if(eq(testList,answerList)){
        showToast('순서 일치!');
        success1=true;
        setState((){
          _i=1;
        });
        //Navigator.pop(context,true);
      }else{
        showToast('순서가 맞지 않습니다ㅠㅠ');
        success1=false;
        //Navigator.pop(context,false);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        _checkSuccess();
        return true;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _i,
          children: [
            BackgroundContainer(
              imagePath: 'assets/background/bg2.png',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('최종 추리',style: TextStyle(color: Colors.white,fontFamily: 'dx',fontWeight: FontWeight.normal,fontSize: 25),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardWithNumberButton(
                          imagePath: 'assets/image/episode4/ep4_1.png',
                          number: num3,
                          onTap: (){
                            setState(() {
                              tapIndex++;
                              num3=tapIndex;
                              testList.add(1);
                              _compare();
                            });
                          },
                          isNumberVisible: num3==0?false:true
                      ),
                      SizedBox(width: 8,),
                      CardWithNumberButton(
                          imagePath: 'assets/image/episode4/ep4_4.png',
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
                          imagePath: 'assets/image/episode4/ep4_2.png',
                          number: num1,
                          onTap: (){
                            setState(() {
                              tapIndex++;
                              num1=tapIndex;
                              testList.add(3);
                              _compare();
                            });
                          },
                          isNumberVisible: num1==0?false:true
                      ),
                      SizedBox(width: 8,),
                      CardWithNumberButton(
                          imagePath: 'assets/image/episode4/ep4_3.png',
                          number: num4,
                          onTap: (){
                            setState(() {
                              tapIndex++;
                              num4=tapIndex;
                              testList.add(4);
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
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/episode4/4_3_hdee.jpg')
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 190,),
                  GestureDetector(
                    onTap: (){
                      success2=true;
                      _checkSuccess();
                    },
                    child: Container(
                      width: 200,
                      height: 120,
                      color: Colors.transparent,
                    ),
                  )
                ],
              ),
            )
          ],
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
