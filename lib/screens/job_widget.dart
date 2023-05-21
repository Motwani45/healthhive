import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsapp/models/job_model.dart';
import 'package:gsapp/providers/firebase/firestore/firestore_provider.dart';
import 'package:gsapp/providers/firebase/job/job_firebase.dart';
import 'package:gsapp/screens/doctors/doctor_job_detail.dart';
import 'package:gsapp/screens/interns/intern_job_detail.dart';
import 'package:gsapp/theme/app_decoration.dart';
import 'package:gsapp/theme/app_style.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/image_constants.dart';
import 'package:gsapp/utils/size_utils.dart';
import 'package:gsapp/widgets/custom_button.dart';
import 'package:gsapp/widgets/custom_image_view.dart';


// ignore: must_be_immutable
class JobWidget extends StatefulWidget {
  final JobModel jobModel;
  final int access;
  JobWidget(this.jobModel,this.access);
  @override
  State<JobWidget> createState() => _JobWidgetState();
}

class _JobWidgetState extends State<JobWidget> {
  String? profileUrl;
  @override
  void initState() {
    getProfilePicUrl().then((value) {profileUrl=value;});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 10,
        left: 10,
        right: 10
      ),
      padding: getPadding(
        left: 10,
        top: 13,
        right: 8,
        bottom: 13,
      ),
      decoration: AppDecoration.outlineBlack9004c.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: getPadding(
                top: 2,
                right: 85,
              ),
              child: Row(
                children: [
                  Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27)
                  ),child:profileUrl==null||profileUrl!.isEmpty?SvgPicture.asset(ImageConstant.profilePlaceholder):Image.network(profileUrl!),),

                  Expanded(
                    child: Padding(
                      padding: getPadding(
                        left: 13,
                        top: 10,
                        bottom: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.jobModel.jobTitle,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeSemiBold16Black900,
                          ),
                          Text(
                            widget.jobModel.jobDescription,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeRegular12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getHorizontalSize(
                    55,
                  ),
                  margin: getMargin(
                    top: 1,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "salary\n",
                          style: TextStyle(
                            color: ColorConstant.gray500,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: widget.jobModel.jobStipend,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    63,
                  ),
                  margin: getMargin(
                    left: 56,
                    bottom: 2,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Duration\n",
                          style: TextStyle(
                            color: ColorConstant.gray500,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: widget.jobModel.jobDuration,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: getHorizontalSize(
              64,
            ),
            margin: getMargin(
              top: 10,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Openings\n",
                    style: TextStyle(
                      color: ColorConstant.gray500,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: widget.jobModel.jobOpenings.toString(),
                    style: TextStyle(
                      color: ColorConstant.black900,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CustomButton(
            onTap: (){
              if(widget.access==0){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return InternJobDetailScreen(jobModel: widget.jobModel);
                }));
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DoctorJobDetailScreen(jobModel: widget.jobModel);
                }));
              }
            },
            height: getVerticalSize(
              40,
            ),
            width: getHorizontalSize(
              103,
            ),
            text: "View Details",
            margin: getMargin(
              top: 20,
            ),
            variant: ButtonVariant.FillGreenA400,
            fontStyle: ButtonFontStyle.ManropeBold14,
          ),
        ],
      ),
    );
  }

  Future<String> getProfilePicUrl() async{
    String profileUrl=await JobFirebase().getDoctorProfileUrl(widget.jobModel.jobCreatedBy);
    return profileUrl;
  }
}
