import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as flutter_toast;

void showConnectionErrorToast() {
  flutter_toast.Fluttertoast.showToast(
    msg: "Connection Error",
    
    toastLength: flutter_toast.Toast.LENGTH_LONG,
    gravity: flutter_toast.ToastGravity.TOP,
    timeInSecForIosWeb: 10,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

