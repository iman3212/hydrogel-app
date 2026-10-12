import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  LoginTextfield(
      {super.key,
      required this.controller,
      required this.label,
      required this.icon,
      this.obscureText,
      this.obscureIcon});

  final TextEditingController controller;
  final String label;
  final Icon icon;
  bool? obscureText;
  IconButton? obscureIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        } else {
          return null;
        }
      },
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: obscureIcon,
          ),
          prefixIcon: icon,
          label: Text(
            label,
            
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      controller: controller,
    );
  }
}

