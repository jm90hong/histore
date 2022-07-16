import 'package:flutter/material.dart';



class Episode1EpilogueScreen extends StatefulWidget {
  @override
  _Episode1EpilogueScreenState createState() => _Episode1EpilogueScreenState();
}

class _Episode1EpilogueScreenState extends State<Episode1EpilogueScreen> {


  var pageList=[
    buildProCard(imgPath: 'assets/image/episode1/p1.jpg', onTap: (){}),
    buildProCard(imgPath: 'assets/image/episode1/p2.jpg', onTap: (){}),
    buildProCard(imgPath: 'assets/image/episode1/p3.jpg', onTap: (){}),
    buildProCard(imgPath: 'assets/image/episode1/p4.jpg', onTap: (){}),

  ];

  final int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
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
