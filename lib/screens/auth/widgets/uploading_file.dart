import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
  void showUploadDialog(BuildContext context){
    double progress = 0.0;
    AlertDialog alert=AlertDialog(
      content:Container(
        height: 200.0,
        width: 200.0,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 375),
          child: progress == 100.0
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_rounded,
                color: Colors.green,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Upload Complete',
                style: GoogleFonts.poppins(
                  color: Colors.green,
                ),
              ),
            ],
          )
              : LiquidCircularProgressIndicator(
            value: progress / 100,
            valueColor: AlwaysStoppedAnimation(ColorConstant.greenA400),
            backgroundColor: Colors.white,
            direction: Axis.vertical,
            center: Text(
              "$progress%",
              style: GoogleFonts.poppins(
                  color: Colors.black87, fontSize: 25.0),
            ),
          ),
        ),
      )
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  void dismissUploadDialog(BuildContext context){
    Navigator.of(context).pop();
  }
