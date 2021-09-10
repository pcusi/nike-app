import 'package:flutter/material.dart';
import 'package:nike_app/ui/shared/text.dart';
import 'package:nike_app/ui/ui.dart';

class DetalSizeWidget extends StatefulWidget {
  final double width;
  final double height;
  final String sizeValue;
  final bool withDecoratedContainer;
  final VoidCallback? onTap;
  final double fontSize;
  final double marginRight;

  DetalSizeWidget({
    Key? key,
    this.withDecoratedContainer = false,
    this.onTap,
    required this.width,
    required this.sizeValue,
    required this.height,
    required this.fontSize,
    required this.marginRight,
  }) : super(key: key);

  @override
  _DetalSizeWidgetState createState() => _DetalSizeWidgetState();
}

class _DetalSizeWidgetState extends State<DetalSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.only(right: widget.marginRight),
        decoration: BoxDecoration(
          color: widget.withDecoratedContainer
              ? UI.kFontGray.withOpacity(.25)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextGlobal(
              value: widget.sizeValue,
              fontSize: widget.fontSize,
              fontFamily: 'Roboto',
              fontColor: UI.kFontWhite,
            ),
          ],
        ),
      ),
    );
  }
}
