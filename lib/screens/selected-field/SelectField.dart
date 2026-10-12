import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/constant/padding.dart';
import 'package:hydrogel/screens/ph/controller.dart';
import 'package:hydrogel/screens/quality-control/controller.dart';
import 'package:hydrogel/screens/wifi/wifi.dart';
import 'package:hydrogel/theme/button.dart';

import 'package:hydrogel/theme/colors.dart';

class SelectField extends StatefulWidget {
  const SelectField({super.key});

  @override
  State<SelectField> createState() => _SelectFieldState();
}

class _SelectFieldState extends State<SelectField>
    with TickerProviderStateMixin {
  PlatformFile? file;
  FileType myfiletype = FileType.image;
  TextEditingController textcontroller = TextEditingController(text: 'gcode');
  List<String> extensiontype = ['jpg', 'png'];

  final String source = Get.arguments;

  final QcController qcController = Get.put(QcController());
  final PhController phController = Get.put(PhController());

  late final AnimationController _microController = AnimationController(
    duration: const Duration(milliseconds: 5),
    vsync: this,
  );

  late final Animation<double> _microAnimation = Tween(
    begin: 1.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: _microController, curve: Curves.easeIn));

  late final AnimationController _cameraController = AnimationController(
    duration: const Duration(milliseconds: 5),
    vsync: this,
  );

  late final Animation<double> _cameraAnimation = Tween(
    begin: 1.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: _cameraController, curve: Curves.easeIn));

  late double microScale = 1.0; // Maintain the original scale state for AI
  late double cameraScale =
      1.0; // Maintain the original scale state for Hearing Test

  int micro = 0;
  int camera = 1;
  int selectedItem = 0;

  @override
  void dispose() {
    _microController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: ConstVariable.appSymmetricPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select device",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
                    // textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                  Text(
                    "You can choose the device you want by clicking on one of the images ",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = micro;
                        microScale = 1.0;
                        cameraScale = 0.7;
                      });
                      _microController.forward();
                    },
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context)
                              .size
                              .width), // Ensure container doesn't exceed screen width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          ScaleTransition(
                            scale: _microAnimation,
                            child: Transform.scale(
                              scale: microScale,
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  color: selectedItem == micro
                                      ? Colors.white10
                                      : Colors.white54,
                                ),
                                child: Image.asset(
                                  "assets/img/microscope.png",
                                  width: 190,
                                  height: 190,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  5), // Add some spacing between image and text
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "microscope",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add spacing between title and description
                                  Text(
                                    "Using microscope to taking photos",
                                    style: TextStyle(
                                      color: selectedItem == micro
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = camera;
                        cameraScale = 1.0; // Scale Hearing Test image
                        microScale = 0.7;
                      });
                      _cameraController.forward();
                    },
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context)
                              .size
                              .width), // Ensure container doesn't exceed screen width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          ScaleTransition(
                            scale: _cameraAnimation,
                            child: Transform.scale(
                              scale: cameraScale,
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  color: selectedItem == camera
                                      ? Colors.white10
                                      : Colors.white54,
                                ),
                                child: Image.asset(
                                  "assets/img/mobile.png",
                                  width: 190,
                                  height: 190,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "mobile",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add spacing between title and description
                                  Text(
                                    "choose picture from gallery or camera",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: selectedItem == camera
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyles().primaryButton,
                onPressed: () {
                  // Handle navigation based on selectedItem

                  if (selectedItem == camera) {
                    camerafunc(); // Restore the scale for AI
                  } else if (selectedItem == micro) {
                    Get.to(() => const Wifi());
                  }
                },
                child: Text("Next",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white)),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> camerafunc() async {
    return await Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: LightThemeColor.primaryColor, width: 2)),
                      child: const Icon(Icons.close)))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Image.asset("assets/img/camera.png"),
                Text(
                  "Camera or Gallery",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Do you want to use camera or gallery ? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),
                  //textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              pickSingleFile();
            },
            child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: LightThemeColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Gallery",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ))),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("/camera", arguments: source);
            },
            child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: LightThemeColor.primaryColor, width: 2),
                ),
                child: Center(
                    child: Text(
                  "Camera",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: LightThemeColor.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ))),
          ),
        ],
      ),
    ));
  }

  Future<void> pickSingleFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'], // Only allow JPG and PNG files
    );

    if (result != null && result.files.isNotEmpty) {
      // Extract the first file from the list
      final PlatformFile file = result.files.first;
      // Pass the file to setResult method
      if (source == "fromqc") {
        qcController.setResult(File(file.path!));
      } else if (source == "fromph") {
        phController.setResult(File(file.path!));
      }
    }
  }
}
