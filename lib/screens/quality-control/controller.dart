import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/screens/quality-control/result.dart';
import 'package:hydrogel/services/model/quality_model.dart';
import 'package:hydrogel/services/network.dart';
import 'package:hydrogel/theme/button.dart';

class QcController extends GetxController {
  final RxDouble progress = 0.0.obs;

  late String? wave;
  late String? continuity;
  late double? width;
  late double? height;

  Future<void> setResult(file) async {
    if (!await isInternetConnected()) {
      showNoInternetDialog(file); // Pass file as a parameter
    } else {
      if (file is File) {
        Get.off(
          () => const QualityControlResult(
            points: [],
          ),
          arguments: [file],
        );
      } else {
        Get.offNamed("/quality-result", arguments: [file]);
      }
      try {
        final response = await NetworkService().uploadImage(file, "quality");
        if (response != null && response.statusCode == 200) {
          final data = QcAi.fromJson(response.data);
          wave = boolToString(data.wave, "Wave"); // Corrected method name
          continuity = boolToString(
              data.continuity, "Continuity"); // Corrected method name
          height = data.height;
          width = data.width;
          progress.value = 1.0;
        } else {
          Get.toNamed(Routes.menu);
        }
      } catch (e) {
        Get.toNamed(Routes.menu);
      }
    }
  }

  String boolToString(bool? boolean, String title) {
    if (boolean == true && title == "Wave") {
      return "Fail";
    } else if (boolean == false && title == "Wave") {
      return "Pass";
    } else if (boolean == true && title == "Continuity") {
      return "Pass";
    } else if (boolean == false && title == "Continuity") {
      return "Fail";
    } else {
      return "";
    }
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void showNoInternetDialog(file) {
    Get.dialog(
      AlertDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      //   Navigator.of(context).pop();
                    },
                    icon: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red, width: 2)),
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                        )))),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Image.asset("assets/img/noConnection.png"),
                  const Text(
                    "Ooops !",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'No internet connection',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                   Text(
                    'Please check your internet connection and try again !',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ), // Add padding to title
        actionsPadding:
            const EdgeInsets.fromLTRB(20, 0, 20, 20), // Adjust actions padding
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              style: ButtonStyles().onboardingButton.copyWith(
                  //    maximumSize: MaterialStatePropertyAll(Size(360, 62)),
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () async {
                Get.back();
                if (await isInternetConnected()) {
                  setResult(file);
                } else {
                  showNoInternetDialog(file);
                }
              },
              child: const Text(
                'TRY AGAIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
