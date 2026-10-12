import 'package:flutter/material.dart';
import 'package:hydrogel/theme/button.dart';

class Crouseltem extends StatelessWidget {
  const Crouseltem({
    super.key,
    required this.title,
    required this.content,
    required this.buttonName,
    required this.onButtonPressed,
    required this.colorButton,
  });
  final String title;
  final String content;
  final String buttonName;
  final VoidCallback onButtonPressed;
  final Color colorButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              content,
              style: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  onButtonPressed;
                },
                style: ButtonStyles().carouselButton.copyWith(
                    backgroundColor: MaterialStatePropertyAll(colorButton)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      buttonName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
