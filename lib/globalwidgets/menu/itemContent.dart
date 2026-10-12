import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:hydrogel/globalwidgets/menu/item.dart';
import 'package:hydrogel/routes/routes.dart';

class MenuItemsSection extends StatelessWidget {
  const MenuItemsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuItem(
          title: "Quality",
          icon: TablerIcons.microscope,
          navigate: () => Get.toNamed(Routes.selectdevice, arguments: "fromqc"),
        ),
        MenuItem(
          title: "PH Meter",
          icon: TablerIcons.flask_2,
          navigate: () => Get.toNamed(Routes.phMenu, arguments: "fromph"),
        ),
        MenuItem(
          title: "Config",
          icon: TablerIcons.settings,
          navigate: () => Get.toNamed(Routes.gcode),
        ),
        MenuItem(
          title: "History",
          icon: TablerIcons.history,
          navigate: () => Get.toNamed(Routes.history),
        ),
      ],
    );
  }
}
