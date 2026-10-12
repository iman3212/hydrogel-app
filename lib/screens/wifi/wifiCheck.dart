import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class WifiConnectScreen extends StatefulWidget {
  const WifiConnectScreen({super.key});

  @override
  _WifiConnectScreenState createState() => _WifiConnectScreenState();
}

class _WifiConnectScreenState extends State<WifiConnectScreen> {
  String? _connectedWifi = '';

  @override
  void initState() {
    super.initState();
    _checkWifiConnection();
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
      } else {
 
      }
      final wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
      print(wifiBSSID);
  //    print(connectedWifi);

      // Check if connectedWifi is your desired network, then navigate to the next step
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect to Wi-Fi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Connected Wi-Fi: $_connectedWifi'),
            ElevatedButton(
              onPressed: _checkWifiConnection,
              child: Text('Check Wi-Fi Connection'),
            ),
          ],
        ),
      ),
    );
  }
}
