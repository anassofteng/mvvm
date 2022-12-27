import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.amber,
    );
  }

  static void flushBarErroressage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        titleColor: Colors.white,
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        borderRadius: BorderRadius.circular(10),
        reverseAnimationCurve: Curves.easeOut,
        message: message,
        backgroundColor: Colors.amber,
        title: 'sad',
        messageColor: Colors.black,
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    ));
  }
}
