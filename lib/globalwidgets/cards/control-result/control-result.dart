import 'package:flutter/material.dart';
import 'package:hydrogel/theme/colors.dart';

class ControlResult extends StatelessWidget {
  const ControlResult({
    super.key,
    required this.pic,
    required this.title,
    required this.text,
    required this.result,
  });
  final String pic;
  final String title;
  final String text;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      pic,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  result,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: setColor(result, title),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: LightThemeColor.primaryColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color setColor(result, title) {
  if (title == "Wavy" && result == "Fail") {
    return Colors.red;
  } else if (title == "Continuity" && result == "Fail") {
    return Colors.red;
  } else if (title == "Width" || title == "Height") {
    return Colors.black;
  } else {
    return Colors.green;
  }
}
