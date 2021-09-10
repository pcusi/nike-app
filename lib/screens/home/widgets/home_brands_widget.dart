import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_app/data/brands/brand.dart';
import 'package:nike_app/ui/shared/text.dart';
import 'package:nike_app/ui/ui.dart';

class HomeBrandsWidget extends StatefulWidget {
  final Brand brand;
  final Color fontColor;
  final VoidCallback onTap;
  final bool isUnderline;

  const HomeBrandsWidget({
    Key? key,
    this.isUnderline = false,
    required this.brand,
    required this.fontColor,
    required this.onTap,
  }) : super(key: key);

  @override
  _HomeBrandsWidgetState createState() => _HomeBrandsWidgetState();
}

class _HomeBrandsWidgetState extends State<HomeBrandsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: widget.isUnderline ? UI.kFontWhite : Colors.transparent,
                  width: 1.0, // This would be the width of the underline
                ),
              ),
            ),
            child: TextGlobal(
              fontWeight: FontWeight.bold,
              value: widget.brand.title,
              fontSize: size.height * .02,
              fontFamily: 'Saira',
              fontColor: widget.fontColor,
            ),
          ),
        ),
      ],
    );
  }
}
