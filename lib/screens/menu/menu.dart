import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/constant/padding.dart';
import 'package:hydrogel/globalwidgets/cards/menu-card/menu-card.dart';
import 'package:hydrogel/globalwidgets/connection/noInternet.dart';
import 'package:hydrogel/globalwidgets/menu/carousel.dart';
import 'package:hydrogel/globalwidgets/menu/history.dart';
import 'package:hydrogel/globalwidgets/menu/itemContent.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/screens/menu/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  MenuPageController controller = Get.put(MenuPageController());
  late SharedPreferences _prefs;
  bool _isFirstTime = true;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    checkInternetConnection();
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFirstTime = _prefs.getBool('isFirstTime') ?? true;
      if (_isFirstTime) {
        _prefs.setBool('isFirstTime', false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isConnected
            ? buildMenueScreen()
            : NoInternetScreen(
                onRetry: () {
                  checkInternetConnection();
                },
              ),
      ),
    );
  }

  Widget buildMenueScreen() {
    final screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuCard(context: context, controller: controller),
            Padding(
              padding: ConstVariable.appSymmetricPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MenuItemsSection(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  MenuCarousel(screenHeight: screenHeight),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.history),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("Latest Activity",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.history);
                          },
                          child: const Text("View more")),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  HistoryWidget(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      isConnected = (connectivityResult != ConnectivityResult.none);
    });
  }
}
