import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:histore/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      //DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'histore',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}


