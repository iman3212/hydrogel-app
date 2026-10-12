import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui' as ui;
import 'package:hydrogel/theme/colors.dart';

class ButtonStyles {
//primary button style

  final primaryButton = ButtonStyle(
      backgroundColor:
          const MaterialStatePropertyAll(LightThemeColor.primaryColor),
      minimumSize: const MaterialStatePropertyAll(Size(350, 60)),
      foregroundColor:
          const MaterialStatePropertyAll(LightThemeColor.onPrimary),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))));

//secondary button style

  final secondaryButton = ButtonStyle(
      // side: MaterialStatePropertyAll(
      //     BorderSide(color: LightThemeColor.primaryColor, width: 2)),
      backgroundColor:
          MaterialStateProperty.all(Color.fromARGB(255, 222, 233, 247)),
      maximumSize: const MaterialStatePropertyAll(Size(75, 60)),
      minimumSize: MaterialStateProperty.all(
        const Size(75, 60),
        // Adjust button size
      ),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));

//third button style

  final thirdButton = ButtonStyle(
    surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    )),
    backgroundColor: const MaterialStatePropertyAll(Colors.white),
    side: const MaterialStatePropertyAll(
        BorderSide(color: LightThemeColor.primaryColor, width: 2.3)),
    minimumSize: const MaterialStatePropertyAll(Size(600, 60)),
  );

// dialog button style
  final dialogButton = ButtonStyle(
      maximumSize: const MaterialStatePropertyAll(Size(82, 60)),
      backgroundColor:
          const MaterialStatePropertyAll(LightThemeColor.primaryColor),
      minimumSize: const MaterialStatePropertyAll(Size(80, 60)),
      foregroundColor:
          const MaterialStatePropertyAll(LightThemeColor.primaryColor),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )));

// for carousel items
  final carouselButton = ButtonStyle(
      backgroundColor:
          const MaterialStatePropertyAll(LightThemeColor.primaryColor),
      minimumSize: const MaterialStatePropertyAll(Size(105, 30)),
      maximumSize: const MaterialStatePropertyAll(Size(135, 30)),
      foregroundColor:
          const MaterialStatePropertyAll(LightThemeColor.onPrimary),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));

// for onboarding pages
  final onboardingButton = ButtonStyle(
      backgroundColor:
          const MaterialStatePropertyAll(LightThemeColor.primaryColor),
      minimumSize: const MaterialStatePropertyAll(Size(200, 60)),
      foregroundColor:
          const MaterialStatePropertyAll(LightThemeColor.onPrimary),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
}

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool? processing;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.processing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            LightThemeColor.fourthColor,
            LightThemeColor.thirdColor,
            LightThemeColor.secondaryColor,
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: processing != null && processing!
            ? const SpinKitThreeBounce(
                color: Colors.white,
                size: 22,
              )
            : Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}
