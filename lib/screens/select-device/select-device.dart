import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/screens/ph/controller.dart';
import 'package:hydrogel/screens/quality-control/controller.dart';
import 'package:hydrogel/screens/wifi/wifi.dart';
import 'package:hydrogel/theme/button.dart';

import 'package:hydrogel/theme/colors.dart';

class SelectDevice extends StatefulWidget {
  const SelectDevice({super.key});

  @override
  State<SelectDevice> createState() => _SelectFieldState();
}

class _SelectFieldState extends State<SelectDevice>
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
        body: Stack(children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/img/blue.jpg",
              )),
          Positioned(
            top: 100,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.camera,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Select device",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                              // textAlign: TextAlign.justify,
                              softWrap: true,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Here, you can monitor and capture images of the printing process. Choose your preferred option below to proceed.",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Column(
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
                                border: Border.all(color: selectedItem == micro?LightThemeColor.primaryColor:Colors.white),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 2,
                                  )
                                ]),
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
                                        "assets/img/mic.png",
                                        width: 150,
                                        height: 150,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Microscope",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        const SizedBox(
                                            height:
                                                8), // Add spacing between title and description
                                        Text(
                                          "View and capture detailed images of specific print areas",
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
                          height: 15,
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
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 2,
                                  )
                                ]),
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
                                        "assets/img/camera3.png",
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Camera",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        const SizedBox(
                                            height:
                                                8), // Add spacing between title and description
                                        Text(
                                          "Capture a full image \nof the printed piece",
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                        "vslvmslk k mlksdm kmdssklfdsml  lkmklasm lsml mf fsml  fmslldfmsdl  lfmslfms"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: GradientButton(
                        onPressed: () {
                          if (selectedItem == camera) {
                            // Restore the scale for AI
                          } else if (selectedItem == micro) {
                            Get.to(() => const Wifi());
                          }
                        },
                        text: "Next"),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
