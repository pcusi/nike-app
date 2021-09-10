import 'package:flutter/material.dart';

class TextGlobal extends StatelessWidget {
  final String value;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final String fontFamily;
  final int? maxLines;
  final double margin;
  final double? containerWidth;

  const TextGlobal({
    Key? key,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.margin = 0.0,
    this.containerWidth,
    required this.value,
    required this.fontSize,
    required this.fontFamily,
    required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: containerWidth,
          child: Text(
            value,
            maxLines: maxLines,
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
          ),
        ),
        SizedBox(
          height: margin,
        )
      ],
    );
  }
}
