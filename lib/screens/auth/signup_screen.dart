import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/dialogs/auth_error_dialog.dart';
import 'package:gsapp/providers/firebase/auth/auth_provider.dart';
import 'package:gsapp/providers/firebase/firestore/firestore_provider.dart';
import 'package:gsapp/screens/auth/welcome_screen.dart';
import 'package:gsapp/utils/firebase_utils.dart';
import 'package:provider/provider.dart';
import '../../errors/auth_error.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constants.dart';
import '../../utils/image_constants.dart';
import '../../utils/size_utils.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName='/signup_screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _selectedAccess='Intern';
  CommonUtils utils =CommonUtils();
  bool _isPasswordHidden=false;
  bool _isPasswordHidden1=false;
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailAddressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
void saveForm(BuildContext context)async{
  bool isValid=_formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    _formKey.currentState!.save();
    utils.showLoaderDialog(context, "Signing Up");
    try {
      final userId = await Provider.of<AuthProvider>(context, listen: false)
          .signUp(context, emailAddressController.text.trim(),
          passwordController.text.trim());
      await Provider.of<FirestoreProvider>(context, listen: false)
          .saveUserDataToFirebase(username: usernameController.text.trim(),
          emailAddress: emailAddressController.text.trim(),
          accessType: _selectedAccess,
          context: context);
utils.dismissDialog(context);
Navigator.of(context).pushNamed(WelcomeScreen.routeName,arguments: {'username':usernameController.text.trim(),
  'userId':userId,
  'accessType':_selectedAccess
});
    }
    on FirebaseAuthException catch(e){
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
              begin: Alignment(
                0.5,
                0,
              ),
              end: Alignment(
                0.5,
                1,
              ),
              colors: [
                ColorConstant.black90033,
                ColorConstant.black90033,
              ],
            ),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.srcOver),
              image: AssetImage(
                ImageConstant.imgSignupscreen,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: getPadding(
                  left: 20,
                  top: 2,
                  right: 20,
                  bottom: 2,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: getVerticalSize(
                          73,
                        ),
                        width: getHorizontalSize(
                          158,
                        ),
                        child: AppLogo()
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 3,
                      ),
                      child: Text(
                        "Register",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeBold24,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 20,
                      ),
                      child: Text(
                        "Username",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeSemiBold14,
                      ),
                    ),
                    CustomTextFormField(
                      // focusNode: FocusNode(),
                      validator: (val){
                        val=val!.trim();
                        if(val.isEmpty){
                          return "Please enter a username";
                        }
                        if(val!.length<10){
                          return "Username should be 10 characters long";
                        }
                        return null;
                      },
                      controller: usernameController,
                      hintText: "User name",
                      margin: getMargin(
                        top: 6,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 13,
                      ),
                      child: Text(
                        "Email",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeSemiBold14,
                      ),
                    ),
                    CustomTextFormField(
                      // focusNode: FocusNode(),
                      validator: (val){
                        val=val!.trim();
                        if(val.isEmpty){
                          return "Please enter a email address";
                        }
                        if(!val.contains("@")){
                          return "Username should be containing @";
                        }
                        return null;
                      },
                      controller: emailAddressController,
                      hintText: "Email Address",
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
                    Padding(
                      padding: getPadding(
                        top: 13,
                      ),
                      child: Text(
                        "Confirm Password",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeSemiBold14,
                      ),
                    ),
                    CustomTextFormField(
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
                      // focusNode: FocusNode(),
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      margin: getMargin(
                        top: 7,
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
                          icon: _isPasswordHidden1?Icon(Icons.visibility_off):Icon(Icons.visibility),
                          onPressed: (){
                            setState(() {
                              _isPasswordHidden1=!_isPasswordHidden1;
                            });
                          },
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      isObscureText: _isPasswordHidden1,
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
                        icon: Icon(Icons.arrow_drop_down,color: ColorConstant.whiteA700,size:22,),
                        // iconEnabledColor: Colors.white,
                        decoration: InputDecoration(
                          isDense:true,
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
                          DropdownMenuItem(child: Text("Doctor"),value:"Doctor"),
                          DropdownMenuItem(child: Text("Intern"),value:"Intern"),
                        ],
                        onChanged: (value){
                          _selectedAccess=value!;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          top: 25,
                          bottom: 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                                },
                                text: "Already have an account ? ",
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
                                text: "Login",
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                                },
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
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 15,
                          top: 45,
                          right: 14,
                        ),
                        child: CustomButton(
                          height: getVerticalSize(
                            48,
                          ),
                          width: getHorizontalSize(
                            MediaQuery.of(context).size.width,
                          ),
                          onTap:(){ saveForm(context);},
                          text: "Register",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
