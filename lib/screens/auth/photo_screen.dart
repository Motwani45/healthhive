import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gsapp/providers/firebase/firestore/firestore_provider.dart';
import 'package:gsapp/screens/auth/welcome_screen.dart';
import 'package:gsapp/theme/app_decoration.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/firebase_utils.dart';
import 'package:gsapp/utils/image_constants.dart';
import 'package:gsapp/utils/size_utils.dart';
import 'package:gsapp/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatefulWidget {
  static const routeName="/photo-screen";

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}
class _PhotoScreenState extends State<PhotoScreen> {
  CommonUtils _utils=CommonUtils();
  File? pickedImage;
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
          children: [
            Container(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                GestureDetector(onTap:(){
                  Navigator.pushNamed(context, WelcomeScreen.routeName,arguments: {
                    'username':username,
                    'userId':userId,
                    'accessType':accessType
                  });
                },child: Container(margin:EdgeInsets.only(right: 20),child: Text("SKIP",style: TextStyle(color: Colors.white),)))
              ],
            )
            ),

            Expanded(
              child: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    margin: getMargin(
                      top: 17,
                    ),
                    padding: getPadding(
                      left: 89,
                      top: 55,
                      right: 89,
                      bottom: 55,
                    ),
                    decoration: AppDecoration.white.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: getSize(
                            197,
                          ),
                          width: getSize(
                            197,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border:Border.all(color: Colors.grey,width: 2),
                                  borderRadius: BorderRadius.circular(98)
                                ),
                                child:CircleAvatar(
                                  backgroundImage:pickedImage!=null?Image.file(pickedImage!).image:
                                  Image(
                                    height: 197,
                                    image: Svg(ImageConstant.profilePlaceholder),
                                  ).image
                                  ,
                                  radius: 98,
                                ),
                              ),
                              Positioned(right: 10,bottom: 0,child:
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: (){
                                    pickImage();
                                  },
                                  icon: Icon(Icons.edit,size: 35,),
                                ),
                              ),)
                            ],
                          ),
                        ),
                        CustomButton(
                          onTap:pickedImage==null?null:(){
                            saveImage(userId,accessType,username);
                          },
                          height: getVerticalSize(
                            51,
                          ),
                          text: "Save",
                          margin: getMargin(
                            left: 21,
                            top: 38,
                            right: 20,
                            bottom: 337,
                          ),
                          shape: ButtonShape.CircleBorder28,
                          padding: ButtonPadding.PaddingAll11,
                          fontStyle: ButtonFontStyle.ManropeBold14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickImage() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
      pickedImage=File(image.path);
      });
    }
  }

  void saveImage(String? userId, String? accessType, String? username) async{
    _utils.showLoaderDialog(context, "Uploading Your Profile Image");
    final downloadUrl=await Provider.of<FirestoreProvider>(context,listen: false).saveUserImage(pickedImage: pickedImage, accessType: accessType!, context: context);
    _utils.dismissDialog(context);
    Navigator.pushNamed(context, WelcomeScreen.routeName,arguments: {
      'username':username,
      'userId':userId,
      'accessType':accessType
    });
  }
}
