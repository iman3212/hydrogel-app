import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/globalwidgets/buttons/controll-button.dart';
import 'package:hydrogel/globalwidgets/cards/micro/step-choosing.dart';
import 'package:hydrogel/screens/micro/controller.dart';
import 'package:hydrogel/screens/quality-control/controller.dart';
import 'package:hydrogel/theme/colors.dart';
import 'package:path_provider/path_provider.dart';

class MicroStream extends GetView<MicroController> {
  QcController qcontroller = Get.put(QcController());

  MicroStream({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(
              () => SizedBox(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height,
                child: controller.imageData.value.isNotEmpty
                    ? Image.memory(
                        Uint8List.fromList(controller.imageData.value),
                        gaplessPlayback: true,
                        fit: BoxFit.cover,
                      )
                    : const Text("Loading ..."),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            left: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_up,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_left,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ControllButton(
                                onTap: () {},
                                direction: Icons.close,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_right,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_down,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ControllButton(
                            onTap: () {},
                            direction: Icons.arrow_upward,
                            color: LightThemeColor.primaryColor,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          ControllButton(
                            onTap: () {},
                            direction: Icons.arrow_downward_rounded,
                            color: LightThemeColor.primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => Container(
                      width: 320,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StepChoosing(controller: controller,item: 5,),
                          StepChoosing(controller: controller,item: 10,),
                          StepChoosing(controller: controller,item: 15,),
                          StepChoosing(controller: controller,item: 20,),
                          StepChoosing(controller: controller,item: 25,),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      final directory = await getTemporaryDirectory();
                      final filepath =
                          '${directory.path}${Random().nextInt(99999)}.jpg';
                      // print(filepath);
                      File imgFile = File(filepath);
                      imgFile.writeAsBytesSync(controller.imageData);
                      // qcontroller.setResult(imgFile);
                      Get.defaultDialog(
                        barrierDismissible: false,
                        title: "Error",
                        content: Text("Please connect to internet."),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              //  Get.back();

                              qcontroller.setResult(imgFile);
                              print(imgFile is File);
                              print(imgFile.runtimeType);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: LightThemeColor.primaryColor,
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: const Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 35,
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

