import 'package:flutter/material.dart';
import 'package:hydrogel/globalwidgets/dialog/logout.dart';
import 'package:hydrogel/screens/menu/controller.dart';

class MenuCard extends StatelessWidget {
  MenuCard({
    super.key,
    required this.context,
    required this.controller,
  });

  final BuildContext context;
  final MenuPageController controller;

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/img/menu.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: 50,
          left: 40,
          right: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/img/profile.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi! ${controller.username.value}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                           controller.loginDate.value != null && controller.loginDate.value.toString().length >= 4 ? controller.loginDate.value.toString().substring(0, 4) : 'Invalid Date',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "online",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LogoutDialog(onConfirm: () async {
                          controller.logOut();
                        });
                      });
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 150,
          left: 40,
          right: 40,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${now.year}-${now.month}-${now.day}",
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.lock_clock,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${now.hour} : ${now.minute} : ${now.second}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
