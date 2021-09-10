import 'package:flutter/material.dart';
import 'package:nike_app/ui/ui.dart';

class DetailColorWidget extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback? onTap;
  final double fontSize;
  final double marginRight;
  final Color containerColor;
  final bool correctColor;

  DetailColorWidget({
    Key? key,
    this.onTap,
    this.correctColor = false,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.marginRight,
    required this.containerColor
  }) : super(key: key);

  @override
  _DetailColorWidgetState createState() => _DetailColorWidgetState();
}

class _DetailColorWidgetState extends State<DetailColorWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.only(right: widget.marginRight),
        decoration: BoxDecoration(
          color: widget.containerColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: UI.kFontGray.withOpacity(.4),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.correctColor ? Icon(
              Icons.check,
              color: Colors.white,
            ) : Container()
          ],
        ),
      ),
    );
  }
}
