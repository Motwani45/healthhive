import 'package:flutter/material.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get fillGray900 => BoxDecoration(
    color: ColorConstant.gray900,
  );
  static BoxDecoration get outlineBlack9004c1 => BoxDecoration(
    color: ColorConstant.whiteA700,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black9004c,
        spreadRadius: getHorizontalSize(
          2,
        ),
        blurRadius: getHorizontalSize(
          2,
        ),
        offset: Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineWhiteA700 => BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: ColorConstant.whiteA700,
        width: getHorizontalSize(
          1,
        ),
      ),
    ),
  );
  static BoxDecoration get fillWhiteA70084 => BoxDecoration(
    color: ColorConstant.whiteA70084,
  );
  static BoxDecoration get outlineGray200 => BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: ColorConstant.gray200,
        width: getHorizontalSize(
          1,
        ),
      ),
    ),
  );
  static BoxDecoration get outlineBlack9004c => BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black9004c,
        spreadRadius: getHorizontalSize(
          2,
        ),
        blurRadius: getHorizontalSize(
          2,
        ),
        offset: Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get white => BoxDecoration(
    color: ColorConstant.whiteA700,
  );
  static BoxDecoration get txtGradientDeeppurpleA700Lightblue50000 =>
      BoxDecoration(
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
            ColorConstant.deepPurpleA700,
            ColorConstant.deepPurple30085,
            ColorConstant.lightBlue50000,
          ],
        ),
      );
  static BoxDecoration get outlineGreenA400 => BoxDecoration(
    border: Border.all(
      color: ColorConstant.greenA400,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get gradientGray90019Gray900 => BoxDecoration(
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
        ColorConstant.gray90019,
        ColorConstant.gray900,
      ],
    ),
  );
  static BoxDecoration get outlineBlack90019 => BoxDecoration(
    color: ColorConstant.whiteA70033,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black90019,
        spreadRadius: getHorizontalSize(
          2,
        ),
        blurRadius: getHorizontalSize(
          2,
        ),
        offset: Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get txtFillWhiteA7008c => BoxDecoration(
    color: ColorConstant.whiteA7008c,
  );
  static BoxDecoration get gradientBlack90033Black90033 => BoxDecoration(
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
  );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius customBorderTL30 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
  );

  static BorderRadius roundedBorder25 = BorderRadius.circular(
    getHorizontalSize(
      25,
    ),
  );

  static BorderRadius circleBorder69 = BorderRadius.circular(
    getHorizontalSize(
      69,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius circleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius roundedBorder33 = BorderRadius.circular(
    getHorizontalSize(
      33,
    ),
  );

  static BorderRadius txtRoundedBorder33 = BorderRadius.circular(
    getHorizontalSize(
      33,
    ),
  );

  static BorderRadius roundedBorder42 = BorderRadius.circular(
    getHorizontalSize(
      42,
    ),
  );

  static BorderRadius txtRoundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
