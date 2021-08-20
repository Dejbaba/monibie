
import 'package:flutter/material.dart';
import 'package:monibie/ui/shared/colors.dart';



class StarRating extends StatelessWidget {
  final int value;
  final Color starColor;
  final void Function(int index) onChanged;
  final double starHeight;


  StarRating({this.value = 0, this.starColor = westOrange, this.onChanged, this.starHeight});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: onChanged != null
              ? () {
            onChanged(value == index + 1 ? index : index + 1);
          }
              : null,
          child: Icon(
            index < value ? Icons.star : Icons.star,
            size: starHeight,
            color: index < value ? starColor : nobelGrey,

          ),
        );
      }),
    );
  }
}