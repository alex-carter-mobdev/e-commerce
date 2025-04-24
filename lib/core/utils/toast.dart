import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastify {
  static FToast? fToast;

  static void init(BuildContext context) {
    fToast = FToast();
    fToast!.init(context);
  }

  static void e(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.close, color: Colors.white),
          Flexible(
            child: Text(
              msg,
              style: TextStyle(color: Colors.white),
              softWrap: true,
            ),
          ),
        ],
      ),
    );

    fToast?.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,

      toastDuration: Duration(seconds: 5),
    );
  }
}
