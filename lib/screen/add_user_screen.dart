


import 'package:flutter/material.dart';
import 'package:histore/app_http/user_http.dart';
import 'package:histore/vo/user.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:page_transition/page_transition.dart';

import 'home_screen.dart';

class AddUserScreen extends StatefulWidget {

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {


  TextStyle ts1 = const TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontFamily: 'dx',fontSize: 14);

  TextEditingController idct = TextEditingController();
  TextEditingController pwct = TextEditingController();
  TextEditingController pwchkct = TextEditingController();

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
          child: SingleChildScrollView(
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
                    Image.asset('assets/image/login_duru.png',width: 420,),
                    Positioned(
                      top: 70,
                      child: Container(
                        width: 370,
                        height: 170,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerRight,
                                        width:90,
                                        child: Text('아이디',style: ts1,)
                                    ),
                                    const SizedBox(width: 6,),
                                    AppInput(width: 135,controller: idct,)
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerRight,
                                        width:90,
                                        child: Text('비밀번호',style: ts1,)
                                    ),
                                    const SizedBox(width: 6,),
                                    AppInput(width: 135,isPassword: true,controller: pwct,)
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerRight,
                                        width:90,
                                        child: Text('비밀번호 확인',style: ts1,)
                                    ),
                                    const SizedBox(width: 6,),
                                    AppInput(width: 135,isPassword: true,controller: pwchkct,)
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(width: 15,),
                            SimpleButton(
                                imagePath: 'assets/icon/btn_adduser.png',
                                width: 100,
                                onTap: () async{
                                  //todo 회원가입 시작
                                  var id = idct.text;
                                  var pw = pwct.text;
                                  var pwchk = pwchkct.text;

                                  if(id.length>2 && pw.length>2){
                                    if(pw==pwchk){
                                     var result = await UserHttp.add(
                                         user: User(
                                            id:id,
                                            pw:pw
                                         )
                                     );

                                     if(result=='ok'){
                                       showToast('회원가입 완료!');
                                       Navigator.pop(context);
                                     }else if(result=='dp'){
                                       showToast('이미 가입된 아이디 입니다.');
                                     }


                                    }else{
                                      showToast('비밀번호가 일치하지 않습니다');
                                    }



                                  }else{
                                    showToast('모든 정보를 입력하세요');
                                  }


                                }
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
