import 'package:flutter/material.dart';
import 'package:hydrogel/globalwidgets/buttons/controll-button.dart';
import 'package:hydrogel/theme/colors.dart';

class SetDirection extends StatelessWidget {
  const SetDirection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/img/jel.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            left: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_up,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_left,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ControllButton(
                                onTap: () {},
                                direction: Icons.close,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_right,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ControllButton(
                                onTap: () {},
                                direction: Icons.keyboard_arrow_down,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ControllButton(
                            onTap: () {},
                            direction: Icons.arrow_upward,
                            color: LightThemeColor.primaryColor,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          ControllButton(
                            onTap: () {},
                            direction: Icons.arrow_downward_rounded,
                            color: LightThemeColor.primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 320,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade400, blurRadius: 2)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            color: LightThemeColor.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "5",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(child: const Text("10")),
                        Container(child: const Text("15")),
                        Container(child: const Text("20")),
                        Container(child: const Text("25")),
                    
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: LightThemeColor.primaryColor,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: const Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 35,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


