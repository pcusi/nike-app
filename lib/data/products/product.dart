import 'package:flutter/material.dart' show Color;

class Product {
  final int id;
  final String image;
  final String title;
  final int price;
  final String tag;
  final List<ProductSize> sizes;
  final List<ProductColor> colors;
  final String description;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.tag,
    required this.sizes,
    required this.colors,
    required this.description,
  });

  static List<Product> products = [
    Product(
      id: 1,
      tag: 'yellow',
      image: 'assets/img/4.png',
      title: 'Air Max Yellow',
      description:
          'Get after those long runs with the Nike Air Max Invincible Run Flyknit.',
      price: 150,
      sizes: [
        ProductSize(size: 9),
        ProductSize(size: 9.5),
        ProductSize(size: 10),
        ProductSize(size: 10.5),
        ProductSize(size: 11),
      ],
      colors: [
        ProductColor(
          color: Color(0xFF454C2D),
          productId: 1,
        ),
        ProductColor(
          color: Color(0xFF686D92),
          productId: 3,
        ),
        ProductColor(
          color: Color(0xFF618363),
          productId: 4,
        ),
        ProductColor(
          color: Color(0xFF202020),
          productId: 2
        ),
      ],
    ),
    Product(
      id: 2,
      tag: 'black',
      image: 'assets/img/2.png',
      title: 'Air Max Black',
      price: 180,
      description:
          'Get after those long runs with the Nike Air Max Invincible Run Flyknit.',
      sizes: [
        ProductSize(size: 9),
        ProductSize(size: 9.5),
        ProductSize(size: 10),
        ProductSize(size: 10.5),
        ProductSize(size: 11),
      ],
      colors: [
        ProductColor(
          color: Color(0xFF202020),
          productId: 2,
        ),
        ProductColor(
          color: Color(0xFF454C2D),
          productId: 1,
        ),
        ProductColor(
          color: Color(0xFF686D92),
          productId: 3,
        ),
        ProductColor(
          color: Color(0xFF618363),
          productId: 4,
        ),
      ],
    ),
    Product(
      id: 3,
      tag: 'blue',
      image: 'assets/img/3.png',
      title: 'Air Max Blue',
      price: 180,
      description:
          'Get after those long runs with the Nike Air Max Invincible Run Flyknit.',
      sizes: [
        ProductSize(size: 9),
        ProductSize(size: 9.5),
        ProductSize(size: 10),
        ProductSize(size: 10.5),
        ProductSize(size: 11),
      ],
      colors: [
        ProductColor(
          color: Color(0xFF686D92),
          productId: 3,
        ),
        ProductColor(
          color: Color(0xFF454C2D),
          productId: 1,
        ),
        ProductColor(
          color: Color(0xFF618363),
          productId: 4,
        ),
        ProductColor(
          color: Color(0xFF202020),
          productId: 2,
        ),
      ],
    ),
    Product(
      id: 4,
      tag: 'green',
      image: 'assets/img/1.png',
      title: 'Air Max Green',
      price: 175,
      description:
          'Get after those long runs with the Nike Air Max Invincible Run Flyknit.',
      sizes: [
        ProductSize(size: 9),
        ProductSize(size: 9.5),
        ProductSize(size: 10),
        ProductSize(size: 10.5),
        ProductSize(size: 11),
      ],
      colors: [
        ProductColor(
          color: Color(0xFF618363),
          productId: 4,
        ),
        ProductColor(
          color: Color(0xFF454C2D),
          productId: 1,
        ),
        ProductColor(
          color: Color(0xFF686D92),
          productId: 3,
        ),
        ProductColor(
          color: Color(0xFF202020),
          productId: 2,
        ),
      ],
    ),
  ];
}

class ProductSize {
  final double size;

  ProductSize({required this.size});
}

class ProductColor {
  final Color color;
  final int productId;

  ProductColor({required this.color, required this.productId});
}
