

import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';



class Epi3Game3Screen extends StatefulWidget {
  const Epi3Game3Screen({Key? key}) : super(key: key);

  @override
  State<Epi3Game3Screen> createState() => _Epi3Game3ScreenState();
}

class _Epi3Game3ScreenState extends State<Epi3Game3Screen> {

  var result=false;




  int curIndex=0;
  List<Widget> imgList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgList = [
      _buildImage(imagePath: 'assets/image/episode3/[HistoRe]ep3.1.png'),
      _buildImage(imagePath: 'assets/image/episode3/[HistoRe]ep3.2.png'),
      _buildImage(imagePath: 'assets/image/episode3/[HistoRe]ep3.3.png'),
      _buildImage(imagePath: 'assets/image/episode3/[HistoRe]ep3.4.png'),
      _buildImage(imagePath: 'assets/image/episode3/[HistoRe]ep3.5.png'),
      _buildQuestion(imagePath: 'assets/image/episode3/[HistoRe]ep3.6.png',ox: 'o'),
      _buildQuestion(imagePath: 'assets/image/episode3/[HistoRe]ep3.7.png',ox: 'o'),
      _buildQuestion(imagePath: 'assets/image/episode3/[HistoRe]ep3.8.png',ox: 'o'),

    ];
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,result);

        return true;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: IndexedStack(
            index: curIndex,
            children: imgList,
          ),
        ),
      ),
    );
  }


   void _check(){
      if(curIndex==7){

      }
   }

  Widget _buildQuestion({required String imagePath, required String ox}){
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image:DecorationImage(
              image: AssetImage(
                  imagePath
              ),
              fit: BoxFit.cover
          )
      ),
      child: Stack(
        children: [
          //todo O
          Positioned(
            left: 25,
            bottom: 120,
            child: GestureDetector(
              onTap: (){
                if(ox=='o'){
                  if(curIndex+1==imgList.length){
                    result=true;
                    Navigator.pop(context,result);
                  }else{
                    setState((){
                      curIndex++;
                    });
                  }

                }else{
                  showToast('정답이 아닙니다.');
                }
              },
              child: Container(
                width: 115,
                height: 115,
                color: Colors.transparent,
              ),
            ),
          ),
          //todo X
          Positioned(
            right: 25,
            bottom: 120,
            child: GestureDetector(
              onTap: (){
                if(ox=='x'){
                  if(curIndex+1==imgList.length){
                    result=true;
                    Navigator.pop(context,result);
                  }else{
                    setState((){
                      curIndex++;
                    });
                  }
                }else{
                  showToast('정답이 아닙니다.');
                }

              },
              child: Container(
                width: 115,
                height: 115,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildImage({required String imagePath}){
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage(
                imagePath
            ),
            fit: BoxFit.cover
          )
      ),
      child: Stack(
        children: [
          Positioned(
            right: 60,
            bottom: 25,
            child: GestureDetector(
              onTap: (){
                setState((){
                  curIndex++;
                });

              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
