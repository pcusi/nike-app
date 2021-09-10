import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_app/data/brands/brand.dart';
import 'package:nike_app/data/products/product.dart';
import 'package:nike_app/screens/detail/detail_screen.dart';
import 'package:nike_app/screens/home/widgets/home_brands_widget.dart';
import 'package:nike_app/screens/home/widgets/home_products_widget.dart';
import 'package:nike_app/ui/shared/input.dart';
import 'package:nike_app/ui/shared/text.dart';
import 'package:nike_app/ui/ui.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SafeArea(
            top: true,
            bottom: false,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: constraints.maxWidth,
                height: size.height,
                padding: EdgeInsets.all(size.width * .05),
                decoration: BoxDecoration(
                  color: UI.kBgBlack.withOpacity(.9),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          TextGlobal(
                            value: 'New Collection',
                            fontSize: size.height * .03,
                            fontFamily: 'Saira',
                            fontColor: UI.kFontWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      //separation for brands options navigation
                      SizedBox(height: size.height * .04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * .5,
                            height: size.height * .04,
                            child: ListView.builder(
                              itemCount: Brand.brands.length,
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) => Container(
                                margin:
                                    EdgeInsets.only(right: size.width * .08),
                                child: HomeBrandsWidget(
                                  brand: Brand.brands[index],
                                  fontColor: selectedIndex == index
                                      ? UI.kFontWhite
                                      : UI.kFontGray,
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  isUnderline:
                                      selectedIndex == index ? true : false,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * .32,
                            height: size.height * .05,
                            padding: EdgeInsets.all(size.width * .02),
                            decoration: BoxDecoration(
                              color: UI.kFontGray.withOpacity(.3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: UI.kFontWhite,
                                  size: size.height * .02,
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Container(
                                  width: size.width * .2,
                                  constraints: BoxConstraints(
                                    maxWidth: size.width * .35,
                                  ),
                                  child: InputGlobal(
                                    onChanged: (value) {},
                                    labelText: 'Search...',
                                    labelColor: UI.kFontGray,
                                    hintColor: UI.kFontGray,
                                    fontSize: size.height * .017,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      //separation for shoes list
                      SizedBox(height: size.height * .08),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: (constraints.maxHeight *
                              size.height /
                              Product.products.length),
                        ),
                        child: ListView.builder(
                          itemCount: Product.products.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => Container(
                            width: size.width,
                            margin: EdgeInsets.only(bottom: size.height * .05),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: size.width,
                                  height: size.height * .15,
                                ),
                                Positioned(
                                  right: index % 2 == 1 ? 0 : null,
                                  left: index % 2 == 0 ? 0 : null,
                                  bottom: (index % 2) == 1
                                      ? -size.height * .05
                                      : null,
                                  child: HomeProductsWidget(
                                    product: Product.products[index],
                                    heroScreen: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailScreen(
                                          id: Product.products[index].id,
                                          product: Product.products[index],
                                        ),
                                      ),
                                    ),
                                    width: size.width * .4,
                                    height: size.height * .18,
                                    insideWidth: size.width * .16,
                                    insideHeight: size.width * .16,
                                    shoesWidth: size.width * .5,
                                    shoesHeight: size.height * .4,
                                    shoesPosition: -size.height * .12,
                                    fontTitleSize: size.height * .02,
                                    fontPriceSize: size.height * .025,
                                    margin: size.height * .02,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
