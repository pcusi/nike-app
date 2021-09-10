import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_app/data/products/product.dart';
import 'package:nike_app/ui/shared/text.dart';
import 'package:nike_app/ui/ui.dart';

import 'dart:math' as math;

class HomeProductsWidget extends StatefulWidget {
  final double width;
  final double height;
  final double insideWidth;
  final double insideHeight;
  final double shoesWidth;
  final double shoesHeight;
  final double shoesPosition;
  final double fontTitleSize;
  final double fontPriceSize;
  final double? margin;
  final Product product;
  final VoidCallback heroScreen;

  HomeProductsWidget({
    Key? key,
    this.fontTitleSize = 12.0,
    this.fontPriceSize = 12.0,
    required this.product,
    required this.width,
    required this.height,
    required this.insideWidth,
    required this.insideHeight,
    required this.shoesWidth,
    required this.shoesHeight,
    required this.shoesPosition,
    required this.margin,
    required this.heroScreen,
  }) : super(key: key);

  @override
  _HomeProductsWidgetState createState() => _HomeProductsWidgetState();
}

class _HomeProductsWidgetState extends State<HomeProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: UI.kFontGray.withOpacity(.3),
                borderRadius: BorderRadius.circular(40.0),
              ),
              width: widget.width,
              height: widget.height,
            ),
            Positioned.fill(
              top: widget.shoesPosition,
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: widget.product.tag,
                  child: GestureDetector(
                    onTap: widget.heroScreen,
                    child: Container(
                      width: widget.shoesWidth,
                      height: widget.shoesHeight,
                      child: Transform.rotate(
                        angle: -math.pi / 10.5,
                        child: Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              spreadRadius: 3.0,
                              blurRadius: 25.0,
                              color: UI.kBgDark.withOpacity(.3),
                              offset: Offset(-15.0, 25.0),
                            )
                          ]),
                          child: Image(
                            image: AssetImage(widget.product.image),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: widget.insideWidth,
                  height: widget.insideHeight,
                  decoration: BoxDecoration(
                    color: UI.kBgGray.withOpacity(.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: UI.kFontWhite,
                    size: 28.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: widget.margin),
        TextGlobal(
          value: widget.product.title,
          fontSize: widget.fontTitleSize,
          fontFamily: 'Roboto',
          fontColor: UI.kFontGray,
        ),
        SizedBox(height: widget.margin),
        TextGlobal(
          value: '\$ ${widget.product.price}',
          fontSize: widget.fontPriceSize,
          fontFamily: 'Saira',
          fontColor: UI.kBgGreen,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
