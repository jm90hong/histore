import 'package:flutter/material.dart';
import 'package:histore/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


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

    _goHome();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('histore',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
