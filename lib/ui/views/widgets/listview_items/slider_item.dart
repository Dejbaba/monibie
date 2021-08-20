import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget{

  final String image;
  SliderItem({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(image,fit: BoxFit.cover,)),
    );
  }


}