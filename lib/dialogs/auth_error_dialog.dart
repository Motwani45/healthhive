import 'package:flutter/material.dart';
import 'package:gsapp/dialogs/generic_dialog.dart';
import 'package:gsapp/errors/auth_error.dart';


Future<void> showAuthErrorDialog(
    BuildContext context,
    AuthError error
    ){
  return showGenericDialog<void>(context: context, title: error.dialogTitle, content: error.dialogText, optionsBuilder: (){
    return {
      'OK':true
    };
  });
}