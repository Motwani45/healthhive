import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/utils/firebase_utils.dart';

class AuthProvider with ChangeNotifier{
  FirebaseAuth auth=FirebaseAuth.instance;
  CommonUtils _utils=CommonUtils();
  Future<String?> signUp(BuildContext context,String emailAddress,String password) async{
    try {
      final userDetail=await auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      return userDetail.user!.uid;
    }
    catch(e){
      throw(e);
    }
    return null;
  }
  Future<String?> signIn(BuildContext context,String emailAddress,String password) async{
    try {
      final userDetail=await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      return userDetail.user!.uid;
    }
    catch(e){
      throw(e);
    }
    return null;
  }

}