import 'dart:io';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key, required this.pic});
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ClipRect(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image:FileImage(File(pic)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

