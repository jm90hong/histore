


import 'package:flutter/material.dart';
import 'package:histore/app_http/user_http.dart';
import 'package:histore/vo/user.dart';

class UserModel extends ChangeNotifier{
  User me =  User();


  Future<User> login({required User user}) async{
    User result = await UserHttp.getUserByIdAndPw(user: user);
    me=result;
    print(me.epi1+me.epi2+me.epi3+me.epi4);
    notifyListeners();
    return result;
  }


  Future<dynamic> clearStage({required String stage}) async{
    var result = await UserHttp.clearStage(
          userIdx: me.userIdx,
          stage: stage
      );

    if(stage=='stage1'){
      me.epi1='y';
    }else if(stage=='stage2'){
      me.epi2='y';
    }else if(stage=='stage3'){
      me.epi3='y';
    }else if(stage=='stage4'){
      me.epi4='y';
    }
    notifyListeners();


    return result;
  }


  void resetMe(){
    notifyListeners();
  }

  void test(){
    notifyListeners();
  }



}