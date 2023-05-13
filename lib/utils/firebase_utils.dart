import 'package:flutter/material.dart';

class CommonUtils {
  void showSnackBar({required BuildContext context,required String content}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
  }
  void showLoaderDialog(BuildContext context,String content){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:Text(content)),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  void dismissDialog(BuildContext context){
    Navigator.of(context).pop();
  }



}