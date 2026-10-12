import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hydrogel/screens/ph/result.dart';
import 'package:hydrogel/services/model/ph_model.dart';
import 'package:hydrogel/services/network.dart';

class PhController extends GetxController {
  final RxDouble progress = 0.0.obs;

  late String? phType;
  late double? phNumber;

  Future<void>? setResult(file) async {
    if (file is File) {
      Get.off(() => PhResult(), arguments: [file]);
    } else {
      Get.offNamed("/ph-result", arguments: [file]);
    }

    final response = await NetworkService().uploadImage(file, "ph");
    if (response != null && response.statusCode == 200) {
      final data = PhAi.fromJson(response.data);

      phType = data.phValue;
      phNumber = data.phNumber;
      progress.value = 1.0;
    }
  }
}
