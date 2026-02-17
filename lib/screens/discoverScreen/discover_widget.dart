import 'package:flutter/material.dart';

class SubCategoryModel {
  final String name;
  final int items;

  const SubCategoryModel({required this.name, required this.items});
}

class Products {
  final String banner;
  final String image;
  final Color boxColor;
  final Color backgroundColor;
  final double? right;
  final double? left;
  final double? bottom;
  final double? top;
  final List<SubCategoryModel> subCategories;

  Products({
    required this.image,
    required this.boxColor,
    required this.backgroundColor,
    this.right,
    this.left,
    this.bottom,
    this.top,
    required this.subCategories,
    required this.banner,
  });
}

List<Products> products = [
  Products(
    banner: "CLOTHING",
    image: "assets/images/promotional_image.png",
    backgroundColor: Color(0xffA3A798),
    boxColor: Color(0xffC2C7B5),
    right: -70,
    subCategories: [
      SubCategoryModel(name: "Jacket", items: 128),
      SubCategoryModel(name: "Skirts", items: 40),
      SubCategoryModel(name: "Dresses", items: 36),
      SubCategoryModel(name: "Sweaters", items: 24),
      SubCategoryModel(name: "Jeans", items: 14),
      SubCategoryModel(name: "T-Shirts", items: 12),
      SubCategoryModel(name: "Pants", items: 9),
    ],
  ),
  Products(
    image: "assets/images/promo_banner.png",
    backgroundColor: Color(0xff898280),
    boxColor: Color(0xff9C9492),
    right: -30,
    banner: "ACCESSORIES",
    subCategories: [
      SubCategoryModel(name: "Jacket", items: 128),
      SubCategoryModel(name: "Skirts", items: 40),
      SubCategoryModel(name: "Dresses", items: 36),
      SubCategoryModel(name: "Sweaters", items: 24),
      SubCategoryModel(name: "Jeans", items: 14),
      SubCategoryModel(name: "T-Shirts", items: 12),
      SubCategoryModel(name: "Pants", items: 9),
    ],
  ),
  Products(
    image: "assets/images/promo_banner_3.png",
    backgroundColor: Color(0xff44565C),
    boxColor: Color(0xff5B7178),
    right: -40,
    banner: "SHOES",
    subCategories: [
      SubCategoryModel(name: "Jacket", items: 128),
      SubCategoryModel(name: "Skirts", items: 40),
      SubCategoryModel(name: "Dresses", items: 36),
      SubCategoryModel(name: "Sweaters", items: 24),
      SubCategoryModel(name: "Jeans", items: 14),
      SubCategoryModel(name: "T-Shirts", items: 12),
      SubCategoryModel(name: "Pants", items: 9),
    ],
  ),
  Products(
    image: "assets/images/promo_banner_4.png",
    boxColor: Color(0xffB9AEB2),
    backgroundColor: Color(0xffD1CACD),
    right: 30,
    banner: "COLLECTION",
    subCategories: [
      SubCategoryModel(name: "Jacket", items: 128),
      SubCategoryModel(name: "Skirts", items: 40),
      SubCategoryModel(name: "Dresses", items: 36),
      SubCategoryModel(name: "Sweaters", items: 24),
      SubCategoryModel(name: "Jeans", items: 14),
      SubCategoryModel(name: "T-Shirts", items: 12),
      SubCategoryModel(name: "Pants", items: 9),
    ],
  ),
];
