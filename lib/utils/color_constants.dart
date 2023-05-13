import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color cyan900Af = fromHex('#af12565f');

  static Color whiteA7005e = fromHex('#5effffff');

  static Color whiteA7003d = fromHex('#3dffffff');

  static Color red300 = fromHex('#ff7070');

  static Color gray80003 = fromHex('#404040');

  static Color blueA200 = fromHex('#3d8aff');

  static Color gray80002 = fromHex('#4d4d4d');

  static Color gray80001 = fromHex('#474747');

  static Color black9003f = fromHex('#3f000000');

  static Color gray90019 = fromHex('#19081c15');

  static Color green400 = fromHex('#54b678');

  static Color greenA400 = fromHex('#0acf83');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color teal500 = fromHex('#16a085');

  static Color black90000 = fromHex('#00000000');

  static Color whiteA70075 = fromHex('#75ffffff');

  static Color black900 = fromHex('#000000');

  static Color blueGray800 = fromHex('#353d4f');

  static Color green40001 = fromHex('#55b779');

  static Color gray400Cc = fromHex('#ccb4b4b4');

  static Color gray40033 = fromHex('#33b4b4b4');

  static Color gray90002 = fromHex('#081c15');

  static Color gray90003 = fromHex('#171717');

  static Color gray400 = fromHex('#b4b4b4');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color gray500 = fromHex('#a4a4a4');

  static Color gray800 = fromHex('#3c3c3c');

  static Color gray900 = fromHex('#272727');

  static Color gray90001 = fromHex('#1e1e1e');

  static Color whiteA7002d = fromHex('#2dffffff');

  static Color gray4007f = fromHex('#7fb4b4b4');

  static Color green50 = fromHex('#d8f3dc');

  static Color gray200 = fromHex('#e9e9e9');

  static Color whiteA70084 = fromHex('#84ffffff');

  static Color gray100 = fromHex('#f4f4f4');

  static Color cyan900Af01 = fromHex('#af13565f');

  static Color black90033 = fromHex('#33000000');

  static Color bluegray400 = fromHex('#888888');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90099 = fromHex('#99000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
