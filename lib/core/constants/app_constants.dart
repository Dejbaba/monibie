

import 'package:flutter/material.dart';
import 'package:monibie/core/models/dummy_brand.dart';
import 'package:monibie/core/models/dummy_product.dart';


///MediaQuery Width(responsiveness)
double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///MediaQuery Height(responsiveness)
double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///design height(responsiveness)
double logicalHeight() {
  return WidgetsBinding.instance.window.physicalSize.height /
      WidgetsBinding.instance.window.devicePixelRatio;
}

///design width(responsiveness)
double logicalWidth() {
  return WidgetsBinding.instance.window.physicalSize.width /
      WidgetsBinding.instance.window.devicePixelRatio;
}

//aspect ratio
double aspectRatio(BuildContext context){

  final double itemHeight = (height(context) - kToolbarHeight - 24) / 2;
  final double itemWidth = width(context) / 2;

  double aspectRatio = (itemWidth / itemHeight);

  return aspectRatio;
}


///dummy Data

List dummySliders = [
  "assets/images/home_slide_1.png",
  "assets/images/home_slide_2.jpeg",
  "assets/images/home_slide_3.jpeg",
];

List dummyTopSellingItems = [
  "assets/images/shoe.png",
  "assets/images/noodles.png",
  "assets/images/watch.png"
];

List dummyElectronics = [
  "assets/images/iron.png","assets/images/iron.png","assets/images/iron.png",

];

List dummyPhones = [
  "assets/images/phone.png","assets/images/phone.png","assets/images/phone.png",

];

List dummyPhoneAccessories = [
  "assets/images/phone.png","assets/images/phone.png","assets/images/phone.png",
];



List dummyBrands = [
  DummyBrand(
    brandLogo: "assets/images/samsung.png",
    sampleProduct: "assets/images/watch.png"
  ),DummyBrand(
    brandLogo: "assets/images/samsung.png",
    sampleProduct: "assets/images/watch.png"
  ),DummyBrand(
    brandLogo: "assets/images/samsung.png",
    sampleProduct: "assets/images/watch.png"
  ),
];

List dummyRecommendedProducts = [
  DummyProduct(
    image: "assets/images/shoe.png",
    currentPrice: '₦35,000',
    oldPrice: '₦50,000',
    name: 'Adidas Yeezy 380  v3 water resistant marking on the inner circumference'
  ),
  DummyProduct(
    image: "assets/images/shoe.png",
    currentPrice: '₦35,000',
    oldPrice: '₦50,000',
    name: 'Adidas Yeezy 380  v3 water resistant marking on the inner circumference'
  ),
  DummyProduct(
    image: "assets/images/shoe.png",
    currentPrice: '₦35,000',
    oldPrice: '₦50,000',
    name: 'Adidas Yeezy 380  v3 water resistant marking on the inner circumference'
  ),
  DummyProduct(
    image: "assets/images/shoe.png",
    currentPrice: '₦35,000',
    oldPrice: '₦50,000',
    name: 'Adidas Yeezy 380  v3 water resistant marking on the inner circumference'
  ),
];


