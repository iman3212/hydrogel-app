import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrogel/theme/colors.dart';

class StopWatchTimer extends StatefulWidget {
  const StopWatchTimer({super.key});

  @override
  State<StopWatchTimer> createState() => _StopWatchTimerState();
}

class _StopWatchTimerState extends State<StopWatchTimer> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  List returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000)
        .toString()
        .padLeft(3, "0"); // this one for the miliseconds
    String seconds = ((milli ~/ 1000) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60)
        .toString()
        .padLeft(2, "0"); // this is for the minute
    //  String hours = ((milli ~/ 1000) ~/ 3600).toString().padLeft(2, "0");

    // return "$minutes  :  $seconds  :  $milliseconds";
    return ["$minutes ", seconds, milliseconds];
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List a = returnFormattedText();
    String min = a[0];
    String sec = a[0];
    String ho = a[0];

    return CupertinoButton(
      onPressed: () {
        handleStartStop();
      },
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 70,
        width: 220,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: LightThemeColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(ho,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500))),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: LightThemeColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(min,  style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500))),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: LightThemeColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(sec,  style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



  // for reset stop watch
              // CupertinoButton(
              //   onPressed: () {
              //     stopwatch.reset();
              //   },
              //   padding: const EdgeInsets.all(0),
              //   child: const Text(
              //     "Reset",
              //     style: TextStyle(
              //       color: Colors.red,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),