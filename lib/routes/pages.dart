import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hydrogel/globalwidgets/connection/noInternet.dart';
import 'package:hydrogel/screens/configration/configration.dart';
import 'package:hydrogel/screens/gcode/gcode.dart';
import 'package:hydrogel/screens/configration/timer.dart';
import 'package:hydrogel/screens/history/history.dart';
import 'package:hydrogel/screens/login/binding.dart';
import 'package:hydrogel/screens/micro/binding.dart';
import 'package:hydrogel/screens/onboarding/onboarding.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/screens/login/login.dart';
import 'package:hydrogel/screens/menu/menu.dart';
import 'package:hydrogel/screens/ph/menu.dart';
import 'package:hydrogel/screens/ph/ph.dart';
import 'package:hydrogel/screens/ph/result.dart';
import 'package:hydrogel/screens/quality-control/set-direction.dart';
import 'package:hydrogel/screens/select-device/select-device.dart';
import 'package:hydrogel/screens/selected-field/SelectField.dart';
import 'package:hydrogel/screens/camera/camera.dart';
import 'package:hydrogel/screens/quality-control/result.dart';
import 'package:hydrogel/screens/micro/micro.dart';
import 'package:hydrogel/screens/quality-control/waiting-indicator.dart';
import 'package:hydrogel/screens/splash/binding.dart';
import 'package:hydrogel/screens/splash/spalsh.dart';
import 'package:hydrogel/screens/history/chart.dart';
import 'package:hydrogel/screens/wifi/data.dart';
import 'package:hydrogel/screens/wifi/wifi.dart';
import 'package:hydrogel/screens/wifi/wifiCheck.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const Splash(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login, page: () => const Login(), binding: LoginBinding()),

    GetPage(name: Routes.menu, page: () => const Menu()),
    GetPage(name: Routes.onboarding, page: () => const OnBoarding()),
    // GetPage(name: Routes.home, page: () => const Home(), binding: HomeBinding()),
    GetPage(
      name: Routes.configration,
      page: () => const Configration(),
    ),
    GetPage(
      name: Routes.stopwatch,
      page: () => const StopWatchTimer(),
    ),
    GetPage(
      name: Routes.ph,
      page: () => Ph(),
    ),
    GetPage(
      name: Routes.phresult,
      page: () => PhResult(),
    ),
    GetPage(
      name: Routes.qualityresult,
      page: () => const QualityControlResult(
        points: [],
      ),
    ),
    GetPage(
      name: Routes.gcode,
      page: () => const Gcode(),
    ),GetPage(
      name: Routes.noInternet,
      page: () =>  NoInternetScreen(onRetry: () {  },),
    ),
    GetPage(
      name: Routes.history,
      page: () => const History(),
    ),

    GetPage(
      name: Routes.selectfield,
      page: () => const SelectField(),
    ),
    GetPage(
      name: Routes.camera,
      page: () => const CameraPage(),
    ),
    GetPage(
      name: Routes.waiting,
      page: () => waiting(),
    ),
    GetPage(
      name: Routes.wifi,
      page: () => const Wifi(),
    ),
    GetPage(
      name: Routes.data,
      page: () => const MobileData(),
    ),GetPage(
      name: Routes.selectdevice,
      page: () => const SelectDevice(),
    ),GetPage(
      name: Routes.wificonnect,
      page: () => const WifiConnectScreen(),
    ),
    GetPage(
      name: Routes.test,
      page: () => const Testpage(),
    ),
    GetPage(
      name: Routes.direction,
      page: () => const SetDirection(),
    ),
    GetPage(
        name: Routes.micro, page: () => MicroStream(), binding: MicroBinding()),GetPage(
        name: Routes.phMenu, page: () => PhMenu()),
        
  ];
}
