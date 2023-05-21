
import 'package:flutter/material.dart';
import 'package:gsapp/models/intern_model.dart';
import 'package:gsapp/models/job_model.dart';
import 'package:gsapp/providers/firebase/job/job_firebase.dart';
import 'package:gsapp/screens/doctors/ApplicantsItemWidget.dart';
import 'package:gsapp/theme/app_decoration.dart';
import 'package:gsapp/theme/app_style.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/size_utils.dart';

class DoctorJobDetailScreen extends StatelessWidget {
  final JobModel jobModel;
  JobFirebase jobFirebase =JobFirebase();
  DoctorJobDetailScreen({
    required this.jobModel
});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Container(
                width: double.maxFinite,
                margin: getMargin(top: 23),
                padding:
                getPadding(left: 16, top: 24, right: 16, bottom: 24),
                decoration: AppDecoration.white.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL30),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Applicants",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold2125Black900),
                      Padding(
                          padding: getPadding(top: 34),
                          child: StreamBuilder<List<InternModel>>(
                            stream: jobFirebase.getInternDetails(context, jobModel.jobId),
                            builder: (context,snapShot) {
                              if(
                              snapShot.connectionState==ConnectionState.waiting
                              ){
                                return const Center(child: CircularProgressIndicator(),);
                              }
                              List<InternModel>? interns=snapShot.data;
                              if(interns==null||interns.length==0){
                                return const Center(child: Text("No Applicants Till Now!"),);
                              }
                              return ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(31));
                                  },
                                  itemCount: interns.length,
                                  itemBuilder: (context, index) {
                                    return ApplicantsItemWidget(internModel: interns[index],);
                                  });
                            }
                          ))
                    ]))));
  }

  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }
}
