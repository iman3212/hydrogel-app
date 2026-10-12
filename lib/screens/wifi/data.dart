import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/screens/quality-control/controller.dart';
import 'package:hydrogel/theme/button.dart';
import 'package:hydrogel/theme/colors.dart';

class MobileData extends StatefulWidget {
  const MobileData({Key? key}) : super(key: key);

  @override
  _MobileDataState createState() => _MobileDataState();
}

class _MobileDataState extends State<MobileData> {
  late File resultImage; // Declare a variable to store the file
  QcController qcontroller = Get.put(QcController());

  @override
  void initState() {
    resultImage = Get.arguments as File;
    print(resultImage); // Receive the file from the previous page
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 18, vertical: screenHeight * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "After processing  ",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Please disconnect microscope's wifi ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    "and switch to other wifi or mobile data ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Center(
                child: Image.asset(
                  "assets/img/wifi.png",
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.3,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                // Mobile Data Container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 1)
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.mobiledata_off,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mobile data",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Turn on your mobile data"),
                                TextButton(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(100, 35),
                                    ),
                                    maximumSize: MaterialStateProperty.all(
                                      const Size(100, 35),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.black,
                                    ),
                                  ),
                                  onPressed: () => Get.toNamed(Routes.menu),
                                  child: const Text(
                                    "Turn on",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                // Wifi Container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 1)
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.wifi,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wifi",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Disconnect microscope's wifi"),
                                TextButton(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(100, 35),
                                    ),
                                    maximumSize: MaterialStateProperty.all(
                                      const Size(100, 35),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      LightThemeColor.primaryColor,
                                    ),
                                  ),
                                  onPressed: () => Get.toNamed(Routes.menu),
                                  child: const Text(
                                    "Turn off",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    qcontroller.setResult(
                        resultImage); // Pass the file as an argument to the next page
                  },
                  style: ButtonStyles().primaryButton,
                  child: Text(
                    "Next",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
