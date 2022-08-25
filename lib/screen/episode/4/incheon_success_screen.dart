import 'package:flutter/material.dart';

class IncheonSuccessScreen extends StatefulWidget {
  const IncheonSuccessScreen({Key? key}) : super(key: key);

  @override
  State<IncheonSuccessScreen> createState() => _IncheonSuccessScreenState();
}

class _IncheonSuccessScreenState extends State<IncheonSuccessScreen> {

  int curIndex=0;
  bool isSuccess=false;

  List<Widget> imageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageList = [
      GestureDetector(
        onTap: (){
          setState((){
            curIndex++;
          });
        },
        child: Image.asset(
          'assets/image/episode4/ics1.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      GestureDetector(
        onTap: (){
          isSuccess=true;
          Navigator.pop(context, isSuccess);
        },
        child: Image.asset(
          'assets/image/episode4/ics2.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context, isSuccess);
        return true;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: IndexedStack(
            index: curIndex,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}



