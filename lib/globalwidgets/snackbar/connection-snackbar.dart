import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class ConnectionSnackbar extends StatelessWidget {
  const ConnectionSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SnackBar(
      content: Column(
        children: [
          Text("Network Error"),
          Text(
              "No internet connection. Please check your connection and try again!")
        ],
      ),
      duration: Duration(seconds: 3),
    );
  }

  void show() {
    Get.snackbar(
      
      "Error",
      "No internet connection. Please check your connection and try again!",
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      instantInit: true,
      snackStyle: SnackStyle.FLOATING,
      // titleText: Text("Error"),
      // messageText: Text("No internet connection. Please check your connection and try again!"),
      snackPosition: SnackPosition.TOP,
       backgroundColor: Colors.white,
       
      colorText: Colors.black,
      duration: const Duration(seconds: 5),
    );
    // print(errorMessage);
  }
}