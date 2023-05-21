import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/utils/firebase_utils.dart';

class AuthProvider with ChangeNotifier{
  FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  CommonUtils _utils=CommonUtils();
  Future<String> getSelectedAccess() async{
    try{
      var doc=await firestore.collection("Intern").doc(auth.currentUser!.uid).get();
      if(doc.exists){
        return "Intern";
      }
      return "Doctor";
    }
    catch(e){
      throw(e);
    }
  }
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

  Future<void> logOut() async{
    try{
      await auth.signOut();
    }
    catch(e){
      throw(e);
    }
  }

}