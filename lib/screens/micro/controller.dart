import 'dart:async';
import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/screens/micro/utils.dart';

class MicroController extends GetxController {
  RxList<int> imageData = <int>[].obs;
  RxInt selectedItem = 5.obs;

  // static const platform = MethodChannel('example.com/channel');

  // Future<bool> changeNetworkToData() async {
  //   try {
  //     return await platform.invokeMethod('changeNetworkToData');
  //   } on PlatformException catch (_) {
  //     return Future.value(false);
  //   }
  // }

  //   Future<bool> changeNetworkToWifi() async {
  //   try {
  //     return await platform.invokeMethod('changeNetworkToWifi');
  //   } on PlatformException catch (_) {
  //     return Future.value(false);
  //   }
  // }

  @override
  void onInit() {
    //  changeNetworkToWifi();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.defaultDialog(
        barrierDismissible: false,
        title: "Error",
        content: Text("Please connect to MKL_WIFI_0A34CC Wifi."),
        actions: [
          TextButton(
            onPressed: () {
              udpClient();
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      );
    });
    super.onInit();
  }

  void udpClient() {
    InternetAddress address = InternetAddress('192.168.1.1');
    int port = 7080;

    RawDatagramSocket.bind(InternetAddress.anyIPv4, port)
        .then((RawDatagramSocket socket) {
      List<int> dataToSend = [32, 54];

      // Sending data
      socket.send(dataToSend, address, port);

      UdpReceiveParser parser = UdpReceiveParser();

      // Receiving data
      socket.listen((RawSocketEvent event) {
        if (event == RawSocketEvent.read) {
          Datagram? datagram = socket.receive();
          if (datagram != null) {
            List<int>? result = parser.parse(datagram.data);
            if (result != null) {
              imageData.value = result;
            }
          }
        }
      });
    }).catchError((error) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: "Error",
        content: Text("Please connect to MKL_WIFI_0A34CC Wifi."),
        actions: [
          TextButton(
            onPressed: () {
              udpClient();
              Get.back();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Get.back();
              AppSettings.openAppSettings(type: AppSettingsType.wifi);
              udpClient();
            },
            child: Text('Try Again'),
          ),
        ],
      );
    });
  }
}
