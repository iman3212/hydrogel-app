import 'package:flutter/material.dart';
import 'package:hydrogel/screens/micro/controller.dart';
import 'package:hydrogel/theme/colors.dart';

class StepChoosing extends StatelessWidget {
   StepChoosing({
    super.key,
    required this.controller,
    required this.item,
  });

  final MicroController controller;
  int item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectedItem.value = item;
      },
      child: Container(
        height: 30,
        width: 60,
        decoration: BoxDecoration(
          color: controller.selectedItem.value == item
              ? LightThemeColor.primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Center(
          child: Center(
            child: Text(
              "$item",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
