


import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/background/bg2.png')
            )
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SimpleButton(
                        imagePath: 'assets/icon/btn_home.png',
                        width: 50,
                        onTap: (){
                          Navigator.pop(context);
                        }
                      )
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/image/login_duru.png',width: 400,),
                  Positioned(
                    top: 70,
                    child: Container(
                      width: 350,
                      height: 150,
                      color: Colors.blue.withOpacity(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text('아이디'),

                                ],
                              ),
                            ],
                          ),
                          SimpleButton(
                              imagePath: 'assets/icon/btn_adduser.png',
                              width: 100,
                              onTap: (){

                              }
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
