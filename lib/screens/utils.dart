

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(toastMsg) {
  Fluttertoast.showToast(
    msg: toastMsg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}

  InputDecoration inputBoxFieldDecoration(labelText) {
    return InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: labelText,
      hintStyle: TextStyle(fontSize: 15, color: Colors.grey[400]),
      // labelStyle: FormStyle.inputTextLabelStyle(),
    );
  }

   TextStyle inputLabelStyle() {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

    showLoaderPop(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }