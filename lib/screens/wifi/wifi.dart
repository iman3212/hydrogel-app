import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/theme/button.dart';
import 'package:hydrogel/theme/colors.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class Wifi extends StatefulWidget {
  const Wifi({Key? key});

  @override
  State<Wifi> createState() => _WifiState();
}

class _WifiState extends State<Wifi> with WidgetsBindingObserver {
  final Completer<void> _resumeCompleter = Completer<void>();

  String? _connectedWifi = '';
  bool loacationOn = false;
  bool wifiOn = false;

  String locationButtonText = "Turn on ";
  String wifiButtonText = "Turn on ";

  final List<AppLifecycleState> stateHistoryList = <AppLifecycleState>[];

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _resumeCompleter.complete();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _checkWifiConnection() async {
    final info = NetworkInfo();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      if (await Permission.locationWhenInUse.request().isGranted) {
        String? connectedWifi = await info.getWifiName();
        setState(() {
          _connectedWifi = connectedWifi;
        });
        print(_connectedWifi);

        if (_connectedWifi == '"MKL_WIFI_0A34CC"') {
          setState(() {
            wifiButtonText = "OK";
            wifiOn = true;
          });
        } else {
          _showAlertDialog(context);
        }
      } else {}
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Warning"),
          content: Text(
              "You are connected to the wrong WiFi. You should connect to MKL_WIFI_0A34CC."),
        );
      },
    );
  }

  Future<void> _waitForWifiConnection() async {
    // Listen for changes in network connectivity using connectivity_plus
    ConnectivityResult previousResult =
        await Connectivity().checkConnectivity();
    if (previousResult != ConnectivityResult.wifi) {
      // Wait for the user to connect to WiFi
      await for (ConnectivityResult result
          in Connectivity().onConnectivityChanged) {
        if (result == ConnectivityResult.wifi) {
          break; // Exit the loop once WiFi is connected
        }
      }
    }
  }

  Future<void> _checkPermissionStatus() async {
    PermissionStatus status = await Permission.location.status;
    setState(() {
      if (status.isGranted) {
        loacationOn = true;
      }
    });
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
                    "Before starting processing  ",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Please turn on your Wifi service before starting processing",
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
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  loacationOn == false
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400, blurRadius: 1)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: screenWidth * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_sharp,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        "Please turn on your wifi",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: Colors.grey.shade700),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                TextButton(
                                  style: const ButtonStyle(
                                      minimumSize: MaterialStatePropertyAll(
                                          Size(100, 40)),
                                      maximumSize: MaterialStatePropertyAll(
                                          Size(100, 40)),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: loacationOn
                                      ? null
                                      : () async {
                                          PermissionStatus status =
                                              await Permission.location.status;
                                          if (status.isGranted) {
                                            // Permission already granted, update text here
                                            setState(() {
                                              locationButtonText =
                                                  "Ok"; // Update buttonText variable
                                              loacationOn = true;
                                            });
                                          } else if (status
                                              .isPermanentlyDenied) {
                                            // Permission permanently denied, guide user to settings
                                            openAppSettings();
                                          } else {
                                            // Permission not granted, request it
                                            status = await Permission.location
                                                .request();
                                            if (status.isGranted) {
                                              // Permission granted after request, update text here
                                              setState(() {
                                                locationButtonText = "Ok";
                                                loacationOn = true;
                                              });
                                            } else {
                                              // Permission still not granted
                                              // You may handle this case accordingly
                                            }
                                          }
                                        },
                                  child: Text(
                                    locationButtonText,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          color: Colors.white,
                        ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade400, blurRadius: 1)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.wifi,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wifi",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "Please turn on your wifi",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.grey.shade700),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          TextButton(
                            style: ButtonStyle(
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(100, 40)),
                                maximumSize: const MaterialStatePropertyAll(
                                    Size(100, 40)),
                                backgroundColor: MaterialStatePropertyAll(
                                    loacationOn ? Colors.black : Colors.grey)),
                            onPressed: () async {
                              if (loacationOn) {
                                switch (OpenSettingsPlus.shared) {
                                  case OpenSettingsPlusAndroid settings:
                                    await settings.wifi();
                                }
                                // Define a Completer to wait for the user to finish connecting to WiFi
                                await _waitForWifiConnection();
                                await _resumeCompleter.future;
                                print("it is complete");
                                await _checkWifiConnection();
                              } else {
                                return;
                              }
                            },
                            child: Text(
                              wifiButtonText,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: loacationOn && wifiOn
                      ? () {
                          Get.offAndToNamed(Routes.micro);
                        }
                      : null,
                  style: ButtonStyles().primaryButton.copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                          loacationOn && wifiOn
                              ? LightThemeColor.primaryColor
                              : Colors.grey)),
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
