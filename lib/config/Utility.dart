import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_skeleton/config/palette.dart';
import 'package:flutter_app_skeleton/services/ApiBaseHelper.dart';
import 'package:get/get.dart';
import 'Constant.dart';
import 'package:intl/intl.dart';

class Utility {
  static Utility _sharedInstance;

  static Utility getUtility() {
    if (_sharedInstance == null) {
      _sharedInstance = Utility();
      return _sharedInstance;
    } else {
      return _sharedInstance;
    }
  }

  String fcmToken;

  static showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      // behavior: SnackBarBehavior.floating,
      backgroundColor: Palette.islesTextBoxBlue,
    );
    Scaffold.of(context).showSnackBar(snackBar);
    // Get.showSnackbar(GetBar(title: message, message: message));
  }

  static String getBMDCurrencySign(String currency) {
    if (currency == 'BMD')
      return 'BD';
    else
      ' ';
  }

  static showSnackBarX(String message) {
    Get.snackbar(message, '',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Palette.islesBlue,
        borderRadius: 20,
        titleText: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        ));
  }

  static logsInDebug(String str) {
    assert(() {
      log(str);
      return true;
    }());
  }

  static void show() {
    Get.defaultDialog(
        title: 'NO INTERNET CONNECTION',
        titleStyle: TextStyle(
          fontSize: 12,
          height: 2,
          fontWeight: FontWeight.bold,
        ),
        middleText: "Please check your internet settting.",
        middleTextStyle: TextStyle(fontSize: 14),
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
  }

  static Future<bool> isInternetAvailable({bool showDialog}) async {
    final connectivity = await ApiBaseHelper.connectivity.checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      if (showDialog) {
        show();
      }
      return false;
    }
    return true;
  }
}
