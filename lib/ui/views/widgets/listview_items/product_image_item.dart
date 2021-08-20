import 'package:flutter/material.dart';


class ProductImageItem extends StatelessWidget {

  final String image;
  ProductImageItem({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,fit: BoxFit.cover,
    );
  }
}
