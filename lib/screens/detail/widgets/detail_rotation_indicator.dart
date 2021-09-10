import 'package:flutter/material.dart';
import 'package:nike_app/ui/ui.dart';

class DetailRotationIndicatorWidget extends StatelessWidget {
  const DetailRotationIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: UI.kBgGreen,
        shape: BoxShape.circle,
      ),
    );
  }
}