import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/models/job_model.dart';
import 'package:gsapp/providers/firebase/job/job_firebase.dart';
import 'package:gsapp/theme/app_decoration.dart';
import 'package:gsapp/theme/app_style.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/size_utils.dart';
import 'package:gsapp/widgets/custom_button.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CreateJobScreen extends StatelessWidget {
  TextEditingController frametwoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final JobFirebase jobFirebase = JobFirebase();

  TextEditingController jobTitleController = TextEditingController();

  TextEditingController jobDescriptionController = TextEditingController();

  TextEditingController locationController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController openingController = TextEditingController();

  static const routeName = '/create_job_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            resizeToAvoidBottomInset: false,
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                    IconButton(
                        color: Colors.white,
                        onPressed: () {
                          onTapBtnArrowleft(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    Container(
                        width: double.maxFinite,
                        child: Container(
                            margin: getMargin(top: 16),
                            padding: getPadding(
                                left: 16, top: 23, right: 16, bottom: 23),
                            decoration: AppDecoration.white.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL30),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 6),
                                      child: Text("Create  a Job",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeBold24Gray900)),
                                  Padding(
                                      padding: getPadding(top: 3),
                                      child: Text(
                                          "This job will be showed to Interns around the country",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtManropeRegular14)),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 22),
                                            child: Text("Job  Title",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtManropeMedium16Gray900)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueGray100,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Title of Job"),
                                        focusNode: FocusNode(),
                                        controller: jobTitleController,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: getPadding(top: 18),
                                      child: Text("Description",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeMedium16Gray900)),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueGray100,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Description Of Job",
                                            border: InputBorder.none),
                                        focusNode: FocusNode(),
                                        controller: jobDescriptionController,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: getPadding(top: 16),
                                      child: Text("Location",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeMedium16Gray900)),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueGray100,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Location of Job",
                                            border: InputBorder.none),
                                        focusNode: FocusNode(),
                                        controller: locationController,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: getPadding(top: 16),
                                      child: Text("Duration",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeMedium16Gray900)),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueGray100,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Duration Of Job",
                                            border: InputBorder.none),
                                        focusNode: FocusNode(),
                                        controller: durationController,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: getPadding(top: 18),
                                      child: Text("Salary",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeMedium16Gray900)),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueGray100,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Salary of Job",
                                            border: InputBorder.none),
                                        focusNode: FocusNode(),
                                        controller: salaryController,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: getPadding(top: 18),
                                      child: Text("Openings",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeMedium16Gray900)),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueGray100,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            hintText: "Openings of Job",
                                            border: InputBorder.none),
                                        focusNode: FocusNode(),
                                        controller: openingController,
                                      ),
                                    ),
                                  ),
                                  CustomButton(
                                      height: getVerticalSize(42),
                                      text: "Create",
                                      margin: getMargin(top: 20),
                                      onTap: () => onTapCreate(context))
                                ])))
                  ])))
            ])));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapCreate(BuildContext context) async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    JobModel jobModel = JobModel(
        jobId: DateTime.now().millisecondsSinceEpoch.toString(),
        jobCreatedBy: FirebaseAuth.instance.currentUser!.uid,
        jobTitle: jobTitleController.text,
        jobDescription: jobDescriptionController.text,
        jobDuration: durationController.text,
        jobOpenings: int.parse(openingController.text),
        jobLocation: locationController.text,
        appliedInterns: <String>[],
        jobStipend: salaryController.text);
    await jobFirebase.createJob(context, jobModel);
    Navigator.pop(context);
  }
}
