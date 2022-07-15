import 'package:flutter/material.dart';



class Episode1EpilogueScreen extends StatefulWidget {
  @override
  _Episode1EpilogueScreenState createState() => _Episode1EpilogueScreenState();
}

class _Episode1EpilogueScreenState extends State<Episode1EpilogueScreen> {


  var pageList=[

  ];

  final int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: IndexedStack(
          index: _currentIndex,
          children: [

          ],
        ),
      ),
    );
  }
}
