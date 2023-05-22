import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/screens/auth/login_screen.dart';
import 'package:gsapp/screens/auth/signup_screen.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constants.dart';
import '../../utils/image_constants.dart';
import '../../utils/size_utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                0.5,
                0,
              ),
              end: Alignment(
                0.5,
                1,
              ),
              colors: [
                ColorConstant.black9007f,
                ColorConstant.black900,
              ],
            ),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgFirstscreen,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Learn.",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansRomanBold44,
                ),
                Text(
                  "Grow.",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansRomanBold44,
                ),
                Text(
                  "Collaborate.",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOpenSansRomanBold44,
                ),
                CustomButton(
                  onTap: (){
                    Navigator.of(context).pushNamed(SignupScreen.routeName);
                  },
                  height: getVerticalSize(
                    47,
                  ),
                  text: "Continue with Email",
                  margin: getMargin(
                    top: 29,
                  ),
                  shape: ButtonShape.RoundedBorder10,
                  padding: ButtonPadding.PaddingT12,
                  fontStyle: ButtonFontStyle.ManropeSemiBold16WhiteA700,
                  prefixWidget: Container(
                    margin: getMargin(
                      right: 10,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgMail,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      top: 14,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.of(context).pushNamed(LoginScreen.routeName);
                            },
                            text: "Already have an account ?",
                            style: TextStyle(
                              color: ColorConstant.gray400,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              color: ColorConstant.gray400,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "Login",
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.of(context).pushNamed(LoginScreen.routeName);
                            },
                            style: TextStyle(
                              color: ColorConstant.whiteA700,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

