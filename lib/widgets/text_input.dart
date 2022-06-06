import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInput extends StatelessWidget {
  TextEditingController controller;
  IconData icon;
  String text;
  CustomInput(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: text,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade800)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 1.1))),
    );
  }
}
