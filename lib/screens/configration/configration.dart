import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/screens/configration/timer.dart';
import 'package:hydrogel/screens/menu/menu.dart';
import 'package:hydrogel/theme/button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Configration extends StatelessWidget {
  const Configration({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "This page displays the status of the current printing",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  "You can stop the printing process at any time by pressing the stop button."),
              // Image.asset("assets/img/progressing1.gif"),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/gif/load.gif",
                width: 180,
                height: 180,
              ),
              const SizedBox(
                height: 10,
              ),
              const StopWatchTimer(),
              SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Loading ..."),
                  SizedBox(
                    height: 10,
                  ),
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(20),
                    percent: 1.0,

                    width: 350,
                    lineHeight: 50,
                    progressColor: Colors.black,
                    backgroundColor: Colors.grey[300],
                    animation: true,
                    animationDuration: 1000,
                    center: Text("${(1.0 * 100).toStringAsFixed(0)}%",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color:
                                Colors.white)), // Display the percentage number
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 11, 142, 255),
                      Color.fromARGB(255, 2, 71, 186),
                      Color.fromARGB(255, 0, 31, 97),
                    ])),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    "Stop Printing",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
