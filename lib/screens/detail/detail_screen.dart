import 'dart:ui';

import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_app/data/products/product.dart';
import 'package:nike_app/screens/detail/widgets/detail_color_widget.dart';
import 'package:nike_app/screens/detail/widgets/detail_rotation_indicator.dart';
import 'package:nike_app/screens/detail/widgets/detail_rotation_widget.dart';
import 'package:nike_app/screens/detail/widgets/detail_size_widget.dart';
import 'package:nike_app/ui/shared/text.dart';
import 'package:nike_app/ui/ui.dart';

import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  final Product product;
  final int id;

  DetailScreen({
    Key? key,
    required this.product,
    required this.id,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int sizeSelected = 0;
  int colorSelected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SafeArea(
            top: true,
            bottom: false,
            child: Container(
              width: constraints.maxWidth,
              height: size.height,
              decoration: BoxDecoration(
                color: UI.kBgBlack.withOpacity(.9),
              ),
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * .852,
                    padding: EdgeInsets.all(size.width * .05),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //back and favorite icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.west,
                                  color: UI.kFontWhite,
                                ),
                              ),
                              Icon(
                                Icons.favorite_border_outlined,
                                color: UI.kFontWhite,
                              ),
                            ],
                          ),
                          //product title
                          SizedBox(height: size.height * .04),
                          TextGlobal(
                            containerWidth: size.width,
                            value: "${widget.product.title} Invincible Run",
                            fontSize: size.height * .03,
                            fontFamily: 'Saira',
                            fontColor: UI.kFontWhite,
                          ),
                          //hero shoes image
                          SizedBox(height: size.height * .04),
                          Hero(
                            tag: widget.product.tag,
                            child: Align(
                              alignment: Alignment.center,
                              child: Transform.rotate(
                                angle: math.pi / 15,
                                child: Container(
                                  width: size.width * .6,
                                  child: Image(
                                    image: AssetImage(widget.product.image),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //rotation custom shape action
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Transform(
                                transform: Matrix4(
                                  1,
                                  0,
                                  0,
                                  0,
                                  0,
                                  1,
                                  0,
                                  0,
                                  0,
                                  0,
                                  1,
                                  0,
                                  0,
                                  0,
                                  0,
                                  1,
                                )
                                  ..rotateX(math.pi * (Platform.isIOS ? 6 : 5) -
                                      size.width / (Platform.isIOS ? 0.5 : 2))
                                  ..rotateY(0)
                                  ..rotateZ(0),
                                child: Container(
                                  width: size.width,
                                  height: size.height * .1,
                                  child: CustomPaint(
                                    painter: ShapePainter(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 75.0,
                                            blurRadius: 100.0,
                                            color:
                                                UI.kFontGray.withOpacity(.35),
                                            offset:
                                                Offset(0, -size.height * .1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                bottom: Platform.isIOS
                                    ? -size.height * -0.0001
                                    : -size.height * .05,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: size.width * .08,
                                    height: size.width * .08,
                                    decoration: BoxDecoration(
                                      color: UI.kBgGreen,
                                      borderRadius: BorderRadius.circular(12.0),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2.0,
                                          blurRadius: 25.0,
                                          color: UI.kFontGray.withOpacity(.25),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.code,
                                          color: UI.kBgBlack,
                                          size: size.height * .03,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: Platform.isIOS
                                    ? size.height * .058
                                    : size.height * .03,
                                left: size.width * .2,
                                child: DetailRotationIndicatorWidget(),
                              ),
                              Positioned(
                                bottom: Platform.isIOS
                                    ? size.height * .058
                                    : size.height * .03,
                                right: size.width * .2,
                                child: DetailRotationIndicatorWidget(),
                              ),
                            ],
                          ),
                          //sizes of the shoes
                          SizedBox(height: size.height * .01),
                          Row(
                            children: [
                              Container(
                                width: size.width * .2,
                                child: TextGlobal(
                                  value: 'Size',
                                  fontSize: size.height * .025,
                                  fontFamily: 'Saira',
                                  fontColor: UI.kFontGray,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: size.width * .7,
                                height: size.height * .06,
                                child: ListView.builder(
                                  itemCount: widget.product.sizes.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) => DetalSizeWidget(
                                    width: size.width * .12,
                                    height: size.width * .05,
                                    sizeValue:
                                        "${widget.product.sizes[index].size}",
                                    fontSize: size.height * .02,
                                    marginRight: size.width * .03,
                                    withDecoratedContainer:
                                        sizeSelected == index ? true : false,
                                    onTap: () {
                                      setState(() {
                                        sizeSelected = index;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          //color of the shoes
                          SizedBox(height: size.height * .04),
                          Row(
                            children: [
                              Container(
                                width: size.width * .2,
                                child: TextGlobal(
                                  value: 'Color',
                                  fontSize: size.height * .025,
                                  fontFamily: 'Saira',
                                  fontColor: UI.kFontGray,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: size.width * .7,
                                height: size.height * .05,
                                child: ListView.builder(
                                  itemCount: widget.product.colors.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) => DetailColorWidget(
                                    width: size.width * .105,
                                    height: size.width * .05,
                                    containerColor:
                                        widget.product.colors[index].color,
                                    fontSize: size.height * .025,
                                    marginRight: size.width * .08,
                                    correctColor: widget.id ==
                                            widget
                                                .product.colors[index].productId
                                        ? true
                                        : false,
                                  ),
                                ),
                              )
                            ],
                          ),
                          //description
                          SizedBox(height: size.height * .04),
                          TextGlobal(
                            containerWidth: size.width * .9,
                            value: widget.product.description,
                            fontSize: size.height * .02,
                            fontFamily: 'Roboto',
                            fontColor: UI.kFontGray,
                          )
                        ],
                      ),
                    ),
                  ),
                  //bottom add to cart
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * .12,
                      padding: EdgeInsets.all(size.width * .05),
                      decoration: BoxDecoration(
                        color: UI.kBgDark,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextGlobal(
                                value: "\$ ${widget.product.price}",
                                fontSize: size.height * .03,
                                fontFamily: 'Saira',
                                fontColor: UI.kBgGreen,
                              ),
                            ],
                          ),
                          Container(
                            width: size.width * .6,
                            height: size.height * .1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: UI.kBgGreen.withOpacity(.8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextGlobal(
                                  value: "Buy Now",
                                  fontSize: size.height * .025,
                                  fontFamily: 'Roboto',
                                  fontColor: UI.kBgBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
