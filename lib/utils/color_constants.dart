import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color red500 = fromHex('#ff3232');

  static Color lightBlue50000 = fromHex('#000c98ff');

  static Color gray90019 = fromHex('#19081c15');

  static Color greenA400 = fromHex('#0acf83');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color yellow600 = fromHex('#ffd233');

  static Color greenA700 = fromHex('#14ae5c');

  static Color whiteA70075 = fromHex('#75ffffff');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color black9009b = fromHex('#9b000000');

  static Color greenA40023 = fromHex('#2309cf83');

  static Color whiteA7008c = fromHex('#8cffffff');

  static Color deepPurpleA700 = fromHex('#4118e6');

  static Color black9004c = fromHex('#4c000000');

  static Color gray400 = fromHex('#b4b4b4');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color gray500 = fromHex('#a4a4a4');

  static Color blueGray10099 = fromHex('#99d9d9d9');

  static Color gray900 = fromHex('#081c15');

  static Color whiteA7002d = fromHex('#2dffffff');

  static Color deepPurple30085 = fromHex('#857f6ad6');

  static Color gray4007f = fromHex('#7fb4b4b4');

  static Color gray400B2 = fromHex('#b2b4b4b4');

  static Color gray200 = fromHex('#e9e9e9');

  static Color whiteA70084 = fromHex('#84ffffff');

  static Color black9004f = fromHex('#4f000000');

  static Color black90033 = fromHex('#33000000');

  static Color black90099 = fromHex('#99000000');

  static Color bluegray400 = fromHex('#888888');

  static Color black90019 = fromHex('#19000000');

  static Color black900Ad = fromHex('#ad000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
