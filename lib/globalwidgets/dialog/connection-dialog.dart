import 'package:flutter/material.dart';
import 'package:hydrogel/theme/button.dart';

class ConnectionDialog extends StatelessWidget {
  final Function onRetry;
  const ConnectionDialog({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    //   Navigator.of(context).pop();
                  },
                  icon: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red, width: 2)),
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                      )))),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Image.asset("assets/img/noConnection.png"),
                const Text(
                  "Ooops !",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'No internet connection',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please check your internet connection and try again',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ), // Add padding to title
      actionsPadding:
          const EdgeInsets.fromLTRB(20, 0, 20, 20), // Adjust actions padding
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            style: ButtonStyles().onboardingButton.copyWith(
                //    maximumSize: MaterialStatePropertyAll(Size(360, 62)),
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            onPressed: () async {
              onRetry();
            },
            child: const Text(
              'TRY AGAIN',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
