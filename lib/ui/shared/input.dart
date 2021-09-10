import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputGlobal extends StatelessWidget {
  late bool isPassword;
  late String labelText;
  final Color hintColor;
  final Color labelColor;
  final Function(String) onChanged;
  final double fontSize;

  InputGlobal({
    Key? key,
    this.isPassword = false,
    required this.onChanged,
    required this.labelText,
    required this.labelColor,
    required this.hintColor,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.isPassword ? true : false,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: this.labelColor,
        fontSize: this.fontSize,
      ),
      maxLines: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: this.labelText,
        isCollapsed: true,
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
          color: this.labelColor,
          fontSize: this.fontSize,
        ),
      ),
      onChanged: this.onChanged,
    );
  }
}
