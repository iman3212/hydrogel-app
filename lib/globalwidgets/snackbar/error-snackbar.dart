import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ErrorSnackbar extends StatelessWidget {
  final String errorMessage;
  final int? statusCode;

  ErrorSnackbar({required this.errorMessage, this.statusCode});

  String getMessageForStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 401:
        return "Unauthorized";
      case 402:
        return "Payment Required";
      case 403:
        return "Forbidden";
      case 404:
        return "Not Found";
      case 405:
        return "Method Not Allowed";
      case 406:
        return "Not Acceptable";
      case 407:
        return "Proxy Authentication Required";
      case 408:
        return "Request Timeout";
      case 409:
        return "Conflict";
      case 410:
        return "Gone";
      case 500:
        return "call with ";
      // Add more cases for other status codes as needed
      default:
        return "An unexpected error occurred";
    }
  }

@override
  Widget build(BuildContext context) {
    String statusMessage =
        statusCode != null ? " (${getMessageForStatusCode(statusCode)})" : "";

    return SnackBar(
      content: Text(errorMessage + statusMessage),
      duration: Duration(seconds: 5),
    );
  }

   void show(String errorMessage,
      {int? statusCode}) {
    Get.snackbar(
      "Error",
      errorMessage + (statusCode != null ? " (${getMessageForStatusCode(statusCode)})" : ""),
      duration: Duration(seconds: 5),
    );
    print(errorMessage);
  }
}
