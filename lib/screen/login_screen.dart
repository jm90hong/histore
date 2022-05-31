
import 'package:flutter/material.dart';
import 'package:histore/model/user_model.dart';
import 'package:histore/screen/home_screen.dart';
import 'package:histore/vo/user.dart';
import 'package:histore/widget/app_widget.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  TextStyle ts1 = const TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontFamily: 'dx',fontSize: 14);

  TextEditingController idct = TextEditingController();
  TextEditingController pwct = TextEditingController();


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
                   ),

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
                           ],
                         ),

                         SizedBox(width: 15,),
                         SimpleButton(
                             imagePath: 'assets/icon/btn_login.png',
                             width: 100,
                             onTap: () async{
                                var id = idct.text;
                                var pw = pwct.text;


                                User u = await Provider.of<UserModel>(context,listen: false).login(user: User(
                                  id:id,
                                  pw:pw
                                ));

                                if(u.userIdx!=0){
                                  showToast('${u.id} 님 반갑습니다.');
                                  //pop until
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeScreen()), (route) => false);
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
       ),

     ),
    );
  }
}
