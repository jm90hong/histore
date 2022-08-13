import 'package:flutter/material.dart';



class Episode1EpilogueScreen extends StatefulWidget {
  @override
  _Episode1EpilogueScreenState createState() => _Episode1EpilogueScreenState();
}

class _Episode1EpilogueScreenState extends State<Episode1EpilogueScreen> {

  int _currentIndex=0;
  bool _success = false;


  List<Widget> pageList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageList=[
      buildProCard(imgPath: 'assets/image/episode1/p1.jpg', onTap: (){
        setState((){
          _currentIndex++;
        });
      }),
      buildProCard(imgPath: 'assets/image/episode1/p2.jpg', onTap: (){
        setState((){
          _currentIndex++;
        });
      }),
      buildProCard(imgPath: 'assets/image/episode1/p3.jpg', onTap: (){
        setState((){
          _currentIndex++;
          _success=true;
        });
      }),
      buildProCard(imgPath: 'assets/image/episode1/p4.jpg', onTap: (){

        Navigator.pop(context,"ok");
      }),
    ];
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(_success){
          Navigator.pop(context,"ok");
        }else{
          Navigator.pop(context,"fail");
        }


        return true;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: IndexedStack(
            index: _currentIndex,
            children: pageList,
          ),
        ),
      ),
    );
  }



}


Widget buildProCard({required String imgPath,required Function onTap}){
  return GestureDetector(
    onTap: (){
      onTap();
    },
    child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imgPath,),
          )
      ),
    ),
  );
}