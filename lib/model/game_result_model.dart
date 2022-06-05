


import 'package:flutter/material.dart';

class GameResultModel extends ChangeNotifier{
   bool game1Result=false;
   bool game2Result=false;
   bool game3Result=false;
   bool game4Result=false;


   void makeGameComplete({required String gameType}){
      if(gameType=='game1'){
         game1Result=true;
      }else if(gameType=='game2'){
         game2Result=true;
      }else if(gameType=='game3'){
         game3Result=true;
      }else{
         game4Result=true;
      }
      notifyListeners();
   }

   void refresh(){
      notifyListeners();
   }



}