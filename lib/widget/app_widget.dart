
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastLong(String msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15.0
  );
}


class AppInput extends StatelessWidget {

  double width;
  bool isPassword=false;
  TextEditingController controller;

  AppInput({
    required this.width,
    this.isPassword=false,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: 32,
      color: Color(0xfffcdbaa),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: Colors.black,fontSize: 15),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          isDense: true,
          fillColor: Color(0xfffcdbaa),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}



class SimpleButton extends StatelessWidget {

  String imagePath;
  double width;
  Function onTap;

  SimpleButton({
    required this.imagePath,
    required this.width,
    required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          onTap();
        },
        child: Image.asset(imagePath,width: width,)
    );
  }
}




class CustomButton extends StatefulWidget {
  final String defaultImageFilePath;
  final String pressedImageFilePath;
  final Function onPressed;
  final double width;
  final double height;
  final Widget text;

  CustomButton({
      required this.defaultImageFilePath,
      required this.pressedImageFilePath,
      required this.onPressed,
      required this.width,
      required this.height,
      required this.text
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  int _index = 0;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IndexedStack(
          index: _index, // 0 or 1
          alignment: Alignment.center,
          children: <Widget>[
            GestureDetector(
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    _index = 1;
                  });
                },
                onPanEnd: (DragEndDetails details) {
                  setState(() {
                    _index = 0;
                  });
                  if (widget.onPressed != null) {
                    widget.onPressed();
                  }
                },
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      _index = 0;
                    });
                    if (widget.onPressed != null) {
                      widget.onPressed();
                    }
                  });
                },
                child: Image.file(
                  File(widget.defaultImageFilePath),
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.contain,
                )
            ),
            Image.file(
              File(widget.pressedImageFilePath),
              width: widget.width,
              height: widget.height,
              fit: BoxFit.contain,
            )
          ],
        ),
        IgnorePointer(child: widget.text)
      ],
    );
  }
}
