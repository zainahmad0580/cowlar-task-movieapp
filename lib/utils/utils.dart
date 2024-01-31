import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/utils/app_colors.dart';

class Utils {
  //resuable toast message
  static void toastMessage({String msg = 'Something went wrong'}) {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 3,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      msg: msg,
    ); // Adjust this value to control the distance from the top
  }

  static void snackBarMessage(BuildContext context,
      {String msg = 'Something went wrong'}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), duration: const Duration(seconds: 3)));
  }

  static void showLoader(BuildContext context) {
    var size = MediaQuery.of(context).size;
    showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: Container(
            padding: EdgeInsets.all(size.width * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: const CircularProgressIndicator(color: AppColors.btn),
          ));
        });
  }

  static void hideLoader(BuildContext context) => Navigator.pop(context);
}
