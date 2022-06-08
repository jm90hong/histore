import 'dart:convert';

import 'package:histore/vo/user.dart';
import 'package:http/http.dart' as http;
import 'package:histore/config/app_config.dart';

class UserHttp{



  //todo stage 클린
  static Future<dynamic> clearStage({
    required int userIdx,
    required String stage
  }) async{

    var requestUrl = apiAddress+'/user/clearStage';
    Uri uri = Uri.parse(requestUrl);
    var urlParam = uri.replace(queryParameters: {
      'user_idx':userIdx.toString(),
      'stage':stage.toString()
    });
    var response = await http.get(urlParam);

    return response.body;
  }



  //todo 회원 가입
  static Future<dynamic> add({
    required User user
  }) async{

    var requestUrl = apiAddress+'/user/add';
    Uri uri = Uri.parse(requestUrl);
    var urlParam = uri.replace(queryParameters: {
      'id':user.id.toString(),
      'pw':user.pw.toString()
    });
    var response = await http.get(urlParam);

    return response.body;
  }


  //todo 로그인
  static Future<User> getUserByIdAndPw({
    required User user
  }) async{

    var requestUrl = apiAddress+'/user/getUserByIdAndPw';
    Uri uri = Uri.parse(requestUrl);
    var urlParam = uri.replace(queryParameters: {
      'id':user.id.toString(),
      'pw':user.pw.toString()
    });
    var response = await http.get(urlParam);
    if(response.body.isNotEmpty){
      var json = jsonDecode(response.body);
      return User.fromJson(json);
    }else{
      return User();
    }



  }



}