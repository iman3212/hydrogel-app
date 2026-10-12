import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/globalwidgets/carousel/menueCarousel.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/theme/colors.dart';

class MenuCarousel extends StatelessWidget {
  const MenuCarousel({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Crouseltem(
          title: 'Quality control',
          content: 'In this section, you can check the quality of the printed sample',
          buttonName: 'Quality',
          onButtonPressed: () {
            Get.toNamed(Routes.selectfield);
          },
          colorButton: LightThemeColor.primaryColor,
        ),
        Crouseltem(
          title: 'PH measurement',
          content: 'Measurement of PH number and acidity and alkalinity',
          buttonName: 'PH',
          onButtonPressed: () {
            Get.toNamed(Routes.selectfield);
          },
          colorButton: LightThemeColor.secondaryColor,
        ),
        Crouseltem(
          title: 'Configration',
          content: 'Upload G code and check the print process',
          buttonName: 'Config',
          onButtonPressed: () {
            Get.toNamed(Routes.gcode);
          },
          colorButton: LightThemeColor.thirdColor,
        ),
        Crouseltem(
          title: "History",
          content: 'Check all the activities along with their chart',
          buttonName: 'History',
          onButtonPressed: () {
            Get.toNamed(Routes.history);
          },
          colorButton: LightThemeColor.fourthColor,
        )
      ],
      options: CarouselOptions(
        height: screenHeight * 0.5,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 400),
        viewportFraction: 0.8,
      ),
    );
  }
}
