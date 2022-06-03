


import 'package:flutter/material.dart';
import 'package:histore/app_http/user_http.dart';
import 'package:histore/vo/user.dart';

class UserModel extends ChangeNotifier{
  User me =  User();


  Future<User> login({required User user}) async{
    User result = await UserHttp.getUserByIdAndPw(user: user);
    me=result;
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