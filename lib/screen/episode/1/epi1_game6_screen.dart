import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';


class Epi1Game6Screen extends StatefulWidget {
  const Epi1Game6Screen({Key? key}) : super(key: key);

  @override
  State<Epi1Game6Screen> createState() => _Epi1Game6ScreenState();
}

class _Epi1Game6ScreenState extends State<Epi1Game6Screen> {

  bool _isSuccess=false;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(_isSuccess){
          Navigator.pop(context,true);
        }else{
          Navigator.pop(context,false);
        }


        return true;
      },
      child: Scaffold(
        body: BackgroundContainer(
            imagePath: 'assets/image/episode1/bandae.jpg',
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/duru.png')
                      )
                  ),
                  child: const Center(
                    child: Text('현대의의' ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'dx'),),
                  ),
                ),

                Container(
                  width: 450,
                  height: 100,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        top:35,
                        child: Container(
                          width: 450,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffFFCB62),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('테스트 문구',style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top:0,
                          child: Image.asset('assets/image/episode1/c_basic.png',width: 80,)
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                //todo 카드 3개
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCard(text: '123',onTap: (){

                    }),
                    _buildCard(text: '123',onTap: (){

                    }),
                    _buildCard(text: '123',onTap: (){

                    })
                  ],
                )
              ],
            )
        ),
      ),
    );
  }




 //todo
 Widget _buildCard({required String text,required Function onTap}){
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/image/duru.png')
          )
        ),
        child: Center(
          child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
 }



}

