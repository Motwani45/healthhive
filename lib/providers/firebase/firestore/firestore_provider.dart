import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:gsapp/models/doctor_model.dart';
import 'package:gsapp/models/intern_model.dart';
import 'package:gsapp/utils/firebase_utils.dart';
class FirestoreProvider with ChangeNotifier {
  final FirebaseAuth auth;
  FirestoreProvider({
    required this.auth,
  });
  FirebaseStorage firebaseStorage=FirebaseStorage.instance;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  CommonUtils utils=CommonUtils();
  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask.then((p0) {
      "print $p0";
      return p0;
    });
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> saveUserDataToFirebase({required String username,
    required String emailAddress,
    required String accessType,
    required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String resumeUrl='';
      String profileUrl='';
      Map<String,dynamic> userModel;
      if(accessType=="Doctor"){
        userModel=DoctorModel(userId: uid, username: username, emailAddress: emailAddress, accessType: accessType, jobs: [], resumeUrl: resumeUrl,profileUrl: profileUrl).toMap();
      }
      else{
        userModel=InternModel(userId: uid, username: username, emailAddress: emailAddress, accessType: accessType, resumeUrl: resumeUrl,profileUrl: profileUrl).toMap();
      }
      await firestore.collection(accessType).doc(uid).set(userModel).then((value) {
      });

    } catch (e) {
      utils.showSnackBar(context: context, content: e.toString());
    }
  }
  Future<void> saveUserResume({
    required File? resume,
    required String accessType,
    required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String? resumeUrl;
      if (resume != null) {
        resumeUrl = await
            storeFileToFirebase("resumes/$uid", resume);
      }
      await firestore.collection(accessType).doc(uid).update({'resumeUrl':resumeUrl}).then((value) {
      });

    } catch (e) {
      utils.showSnackBar(context: context, content: e.toString());
    }
  }
  Future<void> saveUserImage({
    required File? pickedImage,
    required String accessType,
    required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String? profileUrl;
      if (pickedImage != null) {
        profileUrl = await
            storeFileToFirebase("profileImage/$uid", pickedImage);
      }
      await firestore.collection(accessType).doc(uid).update({'profileUrl':profileUrl}).then((value) {
      });

    } catch (e) {
      utils.showSnackBar(context: context, content: e.toString());
    }
  }


}
