import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gsapp/models/intern_model.dart';
import 'package:gsapp/models/job_model.dart';
import 'package:gsapp/utils/firebase_utils.dart';

class JobFirebase{
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  final CommonUtils utils=CommonUtils();

  Future<void> createJob(BuildContext context,JobModel jobModel) async{
    utils.showLoaderDialog(context, "Creating Job");
    try{
      await firestore.collection("jobs").doc(jobModel.jobId).set(jobModel.toMap());
    }
    catch(e){
      utils.dismissDialog(context);
      utils.showSnackBar(context: context, content: e.toString());
    }
    utils.dismissDialog(context);
    utils.showSnackBar(context: context, content: "Job Created Successfully");
  }
  Future<void> applyJob(BuildContext context,JobModel jobModel) async{
    utils.showLoaderDialog(context, "Applying Job");
    try{
      jobModel.appliedInterns.add(firebaseAuth.currentUser!.uid);
      await firestore.collection("jobs").doc(jobModel.jobId).set(jobModel.toMap());
    }
    catch(e){
      utils.dismissDialog(context);
      utils.showSnackBar(context: context, content: e.toString());
    }
    utils.dismissDialog(context);
    utils.showSnackBar(context: context, content: "Job Applied Successfully");
  }

  Stream<List<JobModel>> getAllJobs(String uid){
      return firestore.collection("jobs").snapshots().map((event){
        List<JobModel> jobs=[];
        for(var doc in event.docs){
          JobModel jobModel=JobModel.fromMap(doc.data());
          if(!jobModel.appliedInterns.contains(uid)) {
            jobs.add(jobModel);
          }
        }
        return jobs.reversed.toList();
      });
  }
  Stream<List<JobModel>> getAllAppliedJobs(String uid){
      return firestore.collection("jobs").snapshots().map((event){
        List<JobModel> jobs=[];
        for(var doc in event.docs){
          JobModel jobModel=JobModel.fromMap(doc.data());
          if(jobModel.appliedInterns.contains(uid)) {
            jobs.add(jobModel);
          }
        }
        return jobs.reversed.toList();
      });
  }
  
  Stream<List<JobModel>> getJobs(String uid) {
    return firestore.collection("jobs").where("jobCreatedBy", isEqualTo: uid)
        .snapshots()
        .map((event) {
      List<JobModel> jobs = [];
      for (var doc in event.docs) {
        jobs.add(JobModel.fromMap(doc.data()));
      }
      return jobs.reversed.toList();
    });
  }
    Stream<List<InternModel>> getInternDetails(BuildContext context,
        String jobId)  {
        return  firestore.collection("jobs").doc(jobId).snapshots().asyncMap((doc) async{
          List<String> internIds = List<String>.from(doc.data()!["appliedInterns"]);
          List<InternModel> interns=[];
          if (internIds.isEmpty) {
            return interns;
          }
          for (String id in internIds) {
            await firestore.collection("Intern").doc(id).get().then((
                docSnapshot) {
              interns.add(InternModel.fromMap(docSnapshot.data()!));
            });
          }
          return
              interns;
        });
      }
  Future<String> getDoctorProfileUrl(String uid) async{
    var doc=await firestore.collection("Doctor").doc(uid).get();
    String profileUrl=doc.data()!['profileUrl'] as String;
    return profileUrl;
  }

    }
