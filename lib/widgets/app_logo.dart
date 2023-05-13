import 'package:flutter/material.dart';
import 'package:gsapp/utils/image_constants.dart';


import 'custom_image_view.dart';
class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CustomImageView(
          svgPath: ImageConstant.appLogo,
        )
      ),
    );
  }
}
