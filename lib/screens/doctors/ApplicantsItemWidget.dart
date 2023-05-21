import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsapp/models/intern_model.dart';
import 'package:gsapp/screens/pdf_viewer.dart';
import 'package:gsapp/theme/app_style.dart';
import 'package:gsapp/utils/image_constants.dart';

import 'package:gsapp/utils/size_utils.dart';
import 'package:gsapp/widgets/custom_button.dart';
import 'package:gsapp/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ApplicantsItemWidget extends StatelessWidget {
  ApplicantsItemWidget({
    required this.internModel
});
final InternModel internModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: internModel.profileUrl!.isEmpty?SvgPicture.asset(ImageConstant.profilePlaceholder):Image.network(internModel.profileUrl!),
        ),
        Padding(
          padding: getPadding(
            left: 6,
            top: 7,
            bottom: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                internModel.username,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtManropeSemiBold20Black900,
              ),
              Text(
              internModel.emailAddress,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtManropeRegular13,
              ),
            ],
          ),
        ),
        Visibility(
          visible: internModel.resumeUrl!=null,
          child: CustomButton(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return PdfViewer(resumeUrl: internModel.resumeUrl!,);
              }));
            },
            height: getVerticalSize(
              48,
            ),
            width: getHorizontalSize(
              119,
            ),
            text: "View resume",
            margin: getMargin(
              left: 43,
              top: 7,
              bottom: 7,
            ),
            variant: ButtonVariant.FillGreenA400,
            shape: ButtonShape.CircleBorder28,
            padding: ButtonPadding.PaddingAll11,
            fontStyle: ButtonFontStyle.ManropeBold14,
          ),
        ),
      ],
    );
  }
}
