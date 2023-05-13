import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/dialogs/auth_error_dialog.dart';
import 'package:gsapp/errors/auth_error.dart';
import 'package:gsapp/providers/firebase/auth/auth_provider.dart';
import 'package:gsapp/screens/auth/signup_screen.dart';
import 'package:gsapp/utils/firebase_utils.dart';
import 'package:gsapp/widgets/app_logo.dart';
import 'package:provider/provider.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constants.dart';
import '../../utils/image_constants.dart';
import '../../utils/size_utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedAccess = 'Intern';
  bool _isPasswordHidden = false;
  CommonUtils utils = CommonUtils();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void saveForm(BuildContext context) async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    utils.showLoaderDialog(context, "Logging In");
    try {
      await Provider.of<AuthProvider>(context).signIn(
          context, emailController.text.trim(), passwordController.text.trim());
      utils.dismissDialog(context);
      if(_selectedAccess=="Intern"){

      }
      else{

      }
    } on FirebaseAuthException catch (e) {
      utils.dismissDialog(context);
      showAuthErrorDialog(context, AuthError.from(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          height: size.height,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white,Colors.green]
            ),
            image: DecorationImage(colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.srcOver),
              image: AssetImage(ImageConstant.imgLoginscreen,), fit: BoxFit.
              cover,)
            ,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(
                left: 20,
                top: 13,
                right: 20,
                bottom: 13,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        left: 79,
                      ),
                      child: AppLogo()
                  ),


                  Padding(
                    padding: getPadding(
                      top: 14,
                    ),
                    child: Text(
                      "Email",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeSemiBold14,
                    ),
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    validator: (val) {
                      val = val!.trim();
                      if (val.isEmpty) {
                        return "Please enter a email address";
                      }
                      if (!val.contains("@")) {
                        return "Username should be containing @";
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: "Email ",
                    margin: getMargin(
                      top: 7,
                    ),
                    textInputType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 14,
                    ),
                    child: Text(
                      "Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeSemiBold14,
                    ),
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    validator: (val){
                      val=val!.trim();
                      if(val.isEmpty){
                        return "Please enter a Password";
                      }
                      if(val!.length<6){
                        return "Password should be 6 characters long";
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: "Password",
                    margin: getMargin(
                      top: 6,
                    ),
                    padding: TextFormFieldPadding.PaddingT14,
                    textInputType: TextInputType.visiblePassword,
                    prefix: Container(
                      margin: getMargin(
                        left: 16,
                        top: 16,
                        right: 10,
                        bottom: 16,
                      ),
                      child: CustomImageView(

                        svgPath:
                        ImageConstant.img188277c3e6c54ebba217d77b2f95f018,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    suffix: Container(
                      child: IconButton(
                        icon: _isPasswordHidden?Icon(Icons.visibility_off):Icon(Icons.visibility),
                        onPressed: (){
                          setState(() {
                            _isPasswordHidden=!_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    isObscureText: _isPasswordHidden,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 45,
                    child:
                    DropdownButtonFormField(
                      value: _selectedAccess,
                      dropdownColor: ColorConstant.greenA400,
                      style: TextStyle(
                        color: ColorConstant.whiteA700,
                        fontSize: getFontSize(
                          14,
                        ),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        height: getVerticalSize(
                          1.43,
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down, color: ColorConstant.whiteA700,
                        size: 22,),
                      // iconEnabledColor: Colors.white,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              12.00,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: ColorConstant.whiteA70075,
                      ),
                      items: [
                        DropdownMenuItem(child: Text("Doctor"),
                            value: "Doctor"),
                        DropdownMenuItem(child: Text("Intern"),
                            value: "Intern"),
                      ],
                      onChanged: (value) {
                        _selectedAccess = value!;
                      },
                    ),
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      48,
                    ),
                    text: "Register",
                    margin: getMargin(
                      top: 33,
                    ),
                    onTap: () {
                      saveForm(context);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: getPadding(
                        top: 10,
                      ),
                      child: Text(
                        "Forgot Password?",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeBold14,
                      ),
                    ),
                  ),

                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Padding(
                  //     padding: getPadding(
                  //       top: 15,
                  //     ),
                  //     child: Text(
                  //       "or",
                  //       overflow: TextOverflow.ellipsis,
                  //       textAlign: TextAlign.left,
                  //       style: AppStyle.txtManropeBold2125,
                  //     ),
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Card(
                  //     clipBehavior: Clip.antiAlias,
                  //     elevation: 0,
                  //     margin: getMargin(
                  //       top: 16,
                  //     ),
                  //     color: ColorConstant.whiteA70084,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(
                  //         getHorizontalSize(
                  //           8,
                  //         ),
                  //       ),
                  //     ),
                  //     child: Container(
                  //       height: getVerticalSize(
                  //         48,
                  //       ),
                  //       width: getHorizontalSize(
                  //         54,
                  //       ),
                  //       padding: getPadding(
                  //         left: 15,
                  //         top: 12,
                  //         right: 15,
                  //         bottom: 12,
                  //       ),
                  //       decoration: AppDecoration.fillWhiteA70084.copyWith(
                  //         borderRadius: BorderRadiusStyle.roundedBorder8,
                  //       ),
                  //       child: Stack(
                  //         children: [
                  //           CustomImageView(
                  //             imagePath: ImageConstant.imgGoogle224x24,
                  //             height: getSize(
                  //               24,
                  //             ),
                  //             width: getSize(
                  //               24,
                  //             ),
                  //             alignment: Alignment.center,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        top: 19,
                        bottom: 5,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [

                            TextSpan(
                              text: "Don't have an account ? ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed(
                                      SignupScreen.routeName);
                                },
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(
                                  14,
                                ),
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed(
                                      SignupScreen.routeName);
                                },
                              text: "Register",
                              style: TextStyle(
                                color: ColorConstant.greenA400,
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
      )
      ,
    );
  }
}
