import 'package:flutter/material.dart';
import 'package:histore/screen/login_screen.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';

import 'home_screen.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  void _goHome() async{
    await Future.delayed(Duration(milliseconds: 1400));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //_goHome();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background/bg3.jpg')
              )
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/logo.png',width: 300,),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleButton(
                    imagePath: 'assets/icon/btn_login.png',
                    width: 100,
                    onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: AddUserScreen()));
                    },
                  ),
                  SizedBox(width: 50,),
                  SimpleButton(
                    imagePath: 'assets/icon/btn_adduser.png',
                    width: 100,
                    onTap: (){


                    },
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}
