import 'dart:io';
import 'dart:typed_data';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:hydrogel/globalwidgets/dialog/connection-dialog.dart';
import 'package:hydrogel/globalwidgets/snackbar/connection-snackbar.dart';
import 'package:hydrogel/services/alert.dart';
import 'package:hydrogel/services/exceptions.dart';
import 'package:hydrogel/storage/shared-preferences.dart';

class NetworkService {
  // final ProfileController profileController;

  static final NetworkService _instance = NetworkService._internal();

  ExceptionAlert alertDialog = ExceptionAlert();

  factory NetworkService() => _instance;

  NetworkService._internal();

  final Dio _dio = Dio();

  static const String _baseUrl = 'http://ai-server.hitechprojects.ir:8000/';
  static const String qcUrl =
      "http://ai-server.hitechprojects.ir:8000/history/api/quality/image";

  Future<void> _setHeaders() async {
    var token = await TokenService.getToken();
    _dio.options.headers["Authorization"] = "Token $token";
    //  _dio.options.headers["Authorization"] = "Bearer $token";
  }

  void _setConfigurations() {
    // connectTimeout:
    // const Duration(seconds: 5);
    // receiveTimeout:
    // const Duration(seconds: 5);
    // _dio.options.sendTimeout = Duration(seconds: 5); // 5 seconds
  }

// define get function for better use from get method in dio

  Future<Response?> get(String endpoint,
      {RequestType type = RequestType.POST}) async {
    bool isConnected = await _isConnected();

    if (isConnected) {
      await _setHeaders();
      _setConfigurations();
      final String url = _baseUrl + endpoint;

      try {
        final response = await _dio.get(url);
        return response;
      } catch (e) {
        if (e is DioException) {
          checkException(
            e,
            RequestType.GET,
          );
        } else {
          alertDialog.showAlert(
            context: Get.context!,
            title: 'Error',
            content: "An unexpected error occurred. Please try again later.",
          );
          print(e.toString());
        }
      }
    } else {
      if (type == RequestType.LOGIN) {
        const ConnectionSnackbar().show();
      } else {
        // showDialog(
        //   context: Get.context!,
        //   builder: (BuildContext context) {
        //     return const ConnectionDialog(
        //     );
        //   },
        // );
      }
    }
    return null;
  }

// define post function for better use from post method in dio

  Future<Response?> post(String endpoint, dynamic data,
      {RequestType type = RequestType.POST}) async {
    bool isConnected = await _isConnected();

    if (isConnected) {
      if (!(endpoint.endsWith('register/') || endpoint.endsWith('login'))) {
        await _setHeaders();
      }

      _setConfigurations();
      String url = _baseUrl + endpoint;

      try {
        final response = await _dio.post(
          url,
          data: data,
        );
        return response;
      } catch (e) {
        if (e is DioException) {
          checkException(
            e,
            type,
          );
        } else {
          alertDialog.showAlert(
            context: Get.context!,
            title: 'Error',
            content: "An unexpected error occurred. Please try again later.",
          );
          print(e.toString());
        }
      }
    } else {
      if (type == RequestType.LOGIN) {
        const ConnectionSnackbar().show();
      } else {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return ConnectionDialog(
              onRetry: () {},
            );
          },
        );
      }
    }
    return null;
  }

// define uploadImage to handle image reqiests

  Future<Response?> uploadImage(file, mode) async {
    bool isConnected = await _isConnected();

    if (isConnected) {
      RequestType type = RequestType.POST;
      final String fileName =
          file is File ? file.path.split("/").last : file.files.first.name;
      final String path = file is File ? file.path : file.files.first.path;

      // Compress the image
      File compressedImage = await compressFile(File(path));

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(compressedImage.path,
            filename: fileName),
      });
      try {
        final response = await _dio.post(
          qcUrl,
          data: formData,
        );

        return response;
      } catch (e) {
        if (e is DioException) {
          checkException(e, type);
          print(e);
          print(e.message);
        } else {
          alertDialog.showAlert(
            context: Get.context!,
            title: 'Error',
            content: "An unexpected error occurred. Please try again later.",
          );
          print(e.toString());
        }
      }
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return  ConnectionDialog(
            onRetry: () {},
          );
        },
      );
    }
    return null;

    // const String phUrl =
    //     "http://ai-server.hitechprojects.ir:7003/history/api/ph/image";
    // String url=mode=="ph"?phUrl:qcUrl;
  }

// Function to compress the image file
  Future<File> compressFile(File file) async {
    const int quality = 60; // quality as needed (0-100)

    // use compresswithfile method for compress file
    Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minHeight: 1200,
      minWidth: 700,
      quality: quality,
    );

    if (compressedBytes != null) {
      // Create a new File from the compressed bytes
      File compressedFile =
          File(file.path.replaceAll(RegExp(r'\.\w+$'), '_compressed.jpg'));
      await compressedFile.writeAsBytes(compressedBytes);
      return compressedFile;
    } else {
      throw Exception('Failed to compress image');
    }
  }

  void checkException(
    DioException error,
    RequestType rtpype,
  ) {
    ApiException exception = ApiException();
    List<String> errorMessage = exception.getExceptionMessage(error, rtpype);
    alertDialog.showAlert(
        context: g.Get.context!,
        title: errorMessage[0],
        content: errorMessage[1]);
  }

  Future<bool> _isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
