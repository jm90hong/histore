import 'package:flutter/material.dart';
import 'package:histore/widget/app_widget.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  String a = "대한";
  String b = "장수왕";
  String whoSay = '대한';
  int currentChatIndex=0;
  String msg='';

  List<Map> chatList = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList = [
      {
        'sayer':a,
        'value':'대화1'
      },
      {
        'sayer':b,
        'value':'대화2'
      },
      {
        'sayer':a,
        'value':'대화3'
      },
      {
        'sayer':b,
        'value':'대화4'
      },
      {
        'sayer':'game',
        'value':'game1'
      },
    ];
    msg=chatList[currentChatIndex]['value'];

    print(chatList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        imagePath: 'assets/background/bg4.png',
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 30,
              child: Container(
                width: 520,
                height: 100,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      width: 500,
                      height: 80,
                      child: Center(
                        child: Text(msg),
                      ),
                    ),

                    Positioned(
                      top: 5,
                      left: whoSay=='대한' ? 30 : null,
                      right: whoSay=='장수왕' ? 30 : null,
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/duru.png')
                          )
                        ),
                        child: Center(
                          child: Text(
                            whoSay,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.5
                            ),),
                        ),
                      ),
                    ),




                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: SimpleButton(
                          imagePath: 'assets/icon/btn_right.png',
                          width: 33,
                          onTap: (){
                            setState(() {
                              currentChatIndex++;

                              msg = chatList[currentChatIndex]['value'];
                              whoSay=chatList[currentChatIndex]['sayer'];
                            });
                          }
                      ),
                    )

                  ],
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
