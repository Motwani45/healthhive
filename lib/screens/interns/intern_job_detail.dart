import 'package:flutter/material.dart';
import 'package:gsapp/models/job_model.dart';
import 'package:gsapp/providers/firebase/job/job_firebase.dart';
import 'package:gsapp/theme/app_decoration.dart';
import 'package:gsapp/theme/app_style.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/firebase_utils.dart';
import 'package:gsapp/utils/size_utils.dart';
import 'package:gsapp/widgets/custom_button.dart';

class InternJobDetailScreen extends StatelessWidget {
  CommonUtils utils =CommonUtils();
  JobFirebase jobFirebase=JobFirebase();
  final JobModel jobModel;
  InternJobDetailScreen({super.key,
    required this.jobModel
});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Container(
                width: double.maxFinite,
                margin: getMargin(top: 31),
                padding: getPadding(
                    left: 16, top: 24, right: 16, bottom: 24),
                decoration: AppDecoration.white.copyWith(
                    borderRadius:
                    BorderRadiusStyle.customBorderTL30),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("About Internship",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle
                              .txtManropeBold2125Black900),
                      Padding(
                          padding: getPadding(top: 13),
                          child:
                          Text(jobModel.jobTitle,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                              AppStyle.txtManropeMedium18),
                      ),
                      Container(
                          width: getHorizontalSize(323),
                          margin: getMargin(
                              left: 4, top: 14, right: 15),
                          child: Text(
                              jobModel.jobDescription,
                              maxLines: 8,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .txtManropeRegular14Black900)),
                      Container(
                          width: getHorizontalSize(248),
                          margin: getMargin(top: 19, right: 95),
                          child: Text(
                              "Stipend : ${jobModel.jobStipend}\nDuration : ${jobModel.jobDuration}\nOpening : ${jobModel.jobOpenings}\nlocation  : ${jobModel.jobLocation}",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .txtManropeMedium18Black900)),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(50),
                          width: getHorizontalSize(103),
                          text: "Apply",
                          margin: getMargin(top: 34, bottom: 101),
                          alignment: Alignment.center,
                      onTap: (){
                            applyJob(context);
                      },)
                    ]))));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
  void applyJob(BuildContext context) async{
  await jobFirebase.applyJob(context, jobModel);
  Navigator.of(context).pop();
  }
}
