import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsapp/providers/firebase/firestore/firestore_provider.dart';
import 'package:gsapp/screens/interns/intern_home_screen.dart';
import 'package:gsapp/screens/doctors/doctor_home_screen.dart';
import 'package:gsapp/utils/firebase_utils.dart';
import 'package:gsapp/widgets/app_logo.dart';
import 'package:provider/provider.dart';

import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constants.dart';
import '../../utils/image_constants.dart';
import '../../utils/size_utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

  const WelcomeScreen();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController loadingController;
  CommonUtils _utils = CommonUtils();
  String fileSizeString = "";
  File? _file;
  PlatformFile? _platformFile;

  Future<bool> getFileSize(File file, int decimals) async {
    int bytes = await file.length();
    if (bytes <= 0) return false;
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    var fileSize = ((bytes / pow(1024, i)));
    fileSizeString = "${fileSize.toStringAsFixed(decimals)} ${suffixes[i]}";
    if (i < 2) {
      return true;
    }

    if (i == 2 && fileSize <= 5.0) {
      return true;
    }
    return false;
  }

  selectFile(BuildContext context) async {
    final file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (file != null) {
      _file = File(file.files.single.path!);
      bool isValidFile = await getFileSize(_file!, 1);
      if (!isValidFile) {
        _utils.showSnackBar(
            context: context,
            content: "File size should not be more than 5 MB");
        return;
      }
      setState(() {
        _platformFile = file.files.first;
      });
    }
    loadingController.forward();
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final username = routeData['username'];
    final userId = routeData['userId'];
    final accessType=routeData['accessType'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: getVerticalSize(
                  73,
                ),
                width: getHorizontalSize(
                  158,
                ),
                margin: getMargin(
                  top: 16,
                ),
                child: AppLogo()),
            Expanded(
              child: Container(
                margin: getMargin(
                  top: 15,
                ),
                padding: getPadding(
                  left: 15,
                  top: 26,
                  right: 15,
                  bottom: 26,
                ),
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        341,
                      ),
                      margin: getMargin(
                        top: 14,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Hii ",
                              style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "$username ,\nLet’s personalize your Profile!",
                              style: TextStyle(
                                color: ColorConstant.greenA400,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: getHorizontalSize(
                          230,
                        ),
                        margin: getMargin(
                          top: 7,
                        ),
                        child: Text(
                          "Tell us about your self , this helps us personalize your experience.",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeRegular14,
                        ),
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        selectFile(context);
                      },
                      height: getVerticalSize(
                        56,
                      ),
                      width: getHorizontalSize(
                        183,
                      ),
                      text: "Upload Resume",
                      margin: getMargin(
                        top: 144,
                      ),
                      variant: ButtonVariant.OutlineGreenA400_2,
                      shape: ButtonShape.CircleBorder28,
                      padding: ButtonPadding.PaddingT18,
                      fontStyle: ButtonFontStyle.ManropeSemiBold14GreenA400,
                      prefixWidget: Container(
                        margin: getMargin(
                          right: 10,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgMegaphone,
                        ),
                      ),
                    ),
                    Text(
                      "maximum size 5 MB",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeRegular10,
                    ),
                    _platformFile != null
                        ? Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selected File',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            offset: Offset(0, 1),
                                            blurRadius: 3,
                                            spreadRadius: 2,
                                          )
                                        ]),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: SvgPicture.asset(
                                              ImageConstant.pdfPlaceHolder,
                                              width: 70,
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _platformFile!.name,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                fileSizeString,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        Colors.grey.shade500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  height: 5,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  child:
                                                      LinearProgressIndicator(
                                                    value:
                                                        loadingController.value,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ))
                        : Container(),
                    Spacer(),
                    CustomButton(
                      height: getVerticalSize(
                        42,
                      ),
                      onTap: _platformFile == null ? null : () async{
                        _utils.showLoaderDialog(context, "Uploading Your Resume");
                       final downloadUrl=await Provider.of<FirestoreProvider>(context,listen: false).saveUserResume(resume: _file, accessType: accessType!, context: context);
                       _utils.dismissDialog(context);
                        if(accessType=="Intern"){
                          Navigator.pushNamedAndRemoveUntil(context, InternHomeScreen.routeName, (route) => false);
                        }
                        else{
                          Navigator.pushNamedAndRemoveUntil(context, DoctorHomeScreen.routeName, (route) => false);
                        }

                      },
                      variant: _platformFile == null
                          ? ButtonVariant.GreyVariant
                          : ButtonVariant.FillGreenA400,
                      text: "Let’s Start",
                      shape: ButtonShape.CircleBorder21,
                      fontStyle: ButtonFontStyle.ManropeBold14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
