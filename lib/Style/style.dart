
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed=Color.fromRGBO(231, 28, 36, 1);
const colorGreen=Color.fromRGBO(33, 191, 115, 1);
const colorWhite=Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue=Color.fromRGBO(44, 62, 80, 1);


// Widget ScreenBackground(BuildContext context) {
//   return Image.asset(
//     'assets/images/background.jpg',  // Use Image.asset for JPG/PNG files
//     alignment: Alignment.center,
//     width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height,
//     fit: BoxFit.cover,
//   );
// }


 SliverGridDelegateWithFixedCrossAxisCount ProductGridView(){
   return SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
     mainAxisSpacing: 2,
     mainAxisExtent: 250
   );
  }


InputDecoration AppInputDecoration(label){
   return InputDecoration(
     focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(
         color: colorGreen,width: 1
       ),
       borderRadius: BorderRadius.circular(11),
     ),
      fillColor: colorWhite,
      filled: true,
     contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
     labelText: label,
     enabledBorder: OutlineInputBorder(
       borderSide: BorderSide(
         color: colorWhite,width: 0,
       )
     ),
     border: OutlineInputBorder(),
   );
}

DecoratedBox AppDropDown(child){
  return DecoratedBox(
      decoration:BoxDecoration(
        color: colorWhite,
        border: Border.all(color: colorWhite,width: 1),
        borderRadius: BorderRadius.circular(11),
      ),
     child: Padding(
       padding: EdgeInsets.only(left: 30,right: 30),
       child: child,),
  );
}

ButtonStyle AppButton(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
  );
}
Ink SuccessButton(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(11),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText,style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: colorWhite
      ),),
    ),
  );
}

void ErrorMessage(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}
void SuccessMessage(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

