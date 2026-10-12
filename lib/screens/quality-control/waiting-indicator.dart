import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/screens/quality-control/controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class waiting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QcController waitController = Get.put(QcController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.purple,
                    size: 50,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "In Processing",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Artificial intelligence is processing and extracting data",
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                "please be patient",
                style: TextStyle(color: Colors.grey),
              ),
              Image.asset(
                "assets/img/wait (2).png",
                width: 360,
                height: 360,
              ),
              // Spacer between image and progress indicator
              Obx(
                
                () => LinearPercentIndicator(
                  barRadius: const Radius.circular(20),
                  percent: waitController.progress.value,
                
                  width: MediaQuery.of(context).size.width / 1.1,
                  lineHeight: 40,
                  progressColor: Colors.purple,
                  backgroundColor: Colors.grey[300],
                  animation: true,
                  animationDuration: 1000,
                  center: Text(
                      "${(waitController.progress * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:
                              Colors.white)), // Display the percentage number
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 221, 141, 235))),
                  onPressed: () {},
                  child: const Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
