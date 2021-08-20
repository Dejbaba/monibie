import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientText extends StatelessWidget {
  GradientText(
      this.text, {
        @required this.gradient,
      });

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Circular Std",
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),

      ),
    );
  }
}