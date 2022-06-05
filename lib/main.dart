import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:histore/model/game_result_model.dart';
import 'package:histore/screen/index_screen.dart';
import 'package:histore/screen/add_user_screen.dart';
import 'package:provider/provider.dart';

import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      //DeviceOrientation.landscapeRight,
    ]);

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=>UserModel()),
        ChangeNotifierProvider(create: (context)=>GameResultModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'histore',
        theme: ThemeData(
          fontFamily: 'kp',
          primarySwatch: Colors.blue,
        ),
        home: IndexScreen(),
      ),
    );
  }
}


