import 'package:flutter/material.dart';
import 'package:hydrogel/theme/colors.dart';

class LogoutDialog extends StatelessWidget {
  final Future<void> Function() onConfirm;

  const LogoutDialog({super.key, required this.onConfirm});

//  final MenuPageController controller=Get.put(MenuPageController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: LightThemeColor
                        .primaryColor, // Change to your close button color
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/loggout.png",
                  height: 240,
                  width: 500,
                ),
                const Text(
                  "Log out",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Are you sure you want to log out from your account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onConfirm(); // Call the provided callback on confirm
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color:
                    LightThemeColor.primaryColor, // Change to your button color
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(); // Just close the dialog
            },
            child: Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: LightThemeColor
                      .primaryColor, // Change to your button color
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text(
                  "No",
                  style: TextStyle(
                    color: LightThemeColor
                        .primaryColor, // Change to your button color
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
