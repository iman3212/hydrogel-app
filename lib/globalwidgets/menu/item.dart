import 'package:flutter/material.dart';
import 'package:hydrogel/theme/colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    required this.title,
    required this.icon,
    super.key,
    required this.navigate,
  });

  final String title;
  final IconData icon;
  final void Function() navigate;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;

    final itemWidth = screenWidth * 0.2;
    final itemHeight = screenHeight * 0.3;

    return InkWell(
      splashColor: Colors.grey,
      highlightColor: Colors.grey,
      borderRadius: BorderRadius.circular(50),
      onTap: navigate,
      child: SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100, // Grey shadow color
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(
                    icon,
                    color: LightThemeColor.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
