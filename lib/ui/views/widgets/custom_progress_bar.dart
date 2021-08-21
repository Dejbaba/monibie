import 'package:flutter/material.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressBar extends CustomPainter{

  final Color activeColor;
  final double progress;

  CustomProgressBar({this.activeColor, this.progress});


  @override
  void paint(Canvas canvas, Size size) {

    final foregroundPaint = Paint();
    foregroundPaint.color = altoGrey;
    foregroundPaint.strokeWidth = 12.w;
    foregroundPaint.strokeCap = StrokeCap.round;
    foregroundPaint.style = PaintingStyle.stroke;

    final backgroundPaint = Paint();
    backgroundPaint.color = activeColor;
    backgroundPaint.strokeWidth = 12.w;
    backgroundPaint.strokeCap = StrokeCap.round;
    backgroundPaint.style = PaintingStyle.stroke;


    canvas.drawLine(Offset.zero, Offset(size.width, 0), foregroundPaint);
    canvas.drawLine(Offset.zero, Offset(size.width / progress, 0), backgroundPaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}