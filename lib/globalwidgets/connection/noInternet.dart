import 'package:flutter/material.dart';
import 'package:hydrogel/theme/button.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/modem2.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Ooops !",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.w900, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'No internet connection',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Please check your internet connection and try again',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyles().primaryButton.copyWith(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: onRetry,
              child: const Text(
                'Try Again',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
