import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import '../utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get outlineBlack900192 => BoxDecoration(
    color: ColorConstant.gray90002,
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
          1,
        ),
      ),
    ],
  );
  static BoxDecoration get txtOutlineGray500 => BoxDecoration(
    color: ColorConstant.greenA400,
    border: Border.all(
      color: ColorConstant.gray500,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get outlineBlack900191 => BoxDecoration(
    color: ColorConstant.whiteA700,
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
          1,
        ),
      ),
    ],
  );
  static BoxDecoration get fillGray900 => BoxDecoration(
    color: ColorConstant.gray900,
  );
  static BoxDecoration get txtOutlineGray5001 => BoxDecoration(
    color: ColorConstant.whiteA700,
    border: Border.all(
      color: ColorConstant.gray500,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get fillGray90002 => BoxDecoration(
    color: ColorConstant.gray90002,
  );
  static BoxDecoration get fillWhiteA70084 => BoxDecoration(
    color: ColorConstant.whiteA70084,
  );
  static BoxDecoration get txtFillGray90002 => BoxDecoration(
    color: ColorConstant.gray90002,
  );
  static BoxDecoration get fillBluegray800 => BoxDecoration(
    color: ColorConstant.blueGray800,
  );
  static BoxDecoration get fillBlueA200 => BoxDecoration(
    color: ColorConstant.blueA200,
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
  static BoxDecoration get gradientGray90019Gray90002 => BoxDecoration(
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
        ColorConstant.gray90002,
      ],
    ),
  );
  static BoxDecoration get white => BoxDecoration(
    color: ColorConstant.whiteA700,
  );
  static BoxDecoration get txtFillGreenA400 => BoxDecoration(
    color: ColorConstant.greenA400,
  );
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
    color: ColorConstant.whiteA700,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black9003f,
        spreadRadius: getHorizontalSize(
          2,
        ),
        blurRadius: getHorizontalSize(
          2,
        ),
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get txtWhite => BoxDecoration(
    color: ColorConstant.whiteA700,
    border: Border.all(
      color: ColorConstant.whiteA700,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get gradientCyan900afCyan900af01 => BoxDecoration(
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
        ColorConstant.cyan900Af,
        ColorConstant.cyan900Af01,
      ],
    ),
  );
  static BoxDecoration get fillGreen50 => BoxDecoration(
    color: ColorConstant.green50,
  );
  static BoxDecoration get gradientBlack90000Black900 => BoxDecoration(
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
        ColorConstant.black90000,
        ColorConstant.black900,
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
  static BorderRadius txtCircleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
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

  static BorderRadius customBorderBL18 = BorderRadius.only(
    topRight: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
  );

  static BorderRadius circleBorder27 = BorderRadius.circular(
    getHorizontalSize(
      27,
    ),
  );

  static BorderRadius circleBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17,
    ),
  );

  static BorderRadius customBorderTL18 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
  );

  static BorderRadius customBorderBL30 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        30,
      ),
    ),
  );

  static BorderRadius circleBorder23 = BorderRadius.circular(
    getHorizontalSize(
      23,
    ),
  );

  static BorderRadius circleBorder14 = BorderRadius.circular(
    getHorizontalSize(
      14,
    ),
  );

  static BorderRadius circleBorder69 = BorderRadius.circular(
    getHorizontalSize(
      69,
    ),
  );

  static BorderRadius circleBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius circleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius txtRoundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6,
    ),
  );

  static BorderRadius txtCircleBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );
}
