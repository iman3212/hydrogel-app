import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/screens/ph/controller.dart';

import '../quality-control/controller.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final QcController qcController = Get.put(QcController());
  final PhController phController = Get.put(PhController());

   final source=Get.arguments;
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: context.height,
              child: CameraCamera(
                onFile: (File file) {
                  if (source == "fromqc") {
                    qcController.setResult(file);
                  } else if (source == "fromph") {
                    phController.setResult(file);
                  }
                },
                cameraSide: CameraSide.front,
                enableZoom: false,
                mode: CameraMode.ratioFull,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
