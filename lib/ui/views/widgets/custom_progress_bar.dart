import 'package:flutter/material.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressBar extends CustomPainter{

  final Color activeColor;
  final double progress;

  CustomProgressBar({this.activeColor, this.progress});


  @override
  void paint(Canvas canvas, Size size) {

    final foregreoundPaint = Paint();
    foregreoundPaint.color = altoGrey;
    foregreoundPaint.strokeWidth = 12.w;
    foregreoundPaint.strokeCap = StrokeCap.round;
    foregreoundPaint.style = PaintingStyle.stroke;

    final backgroundPaint = Paint();
    backgroundPaint.color = activeColor;
    backgroundPaint.strokeWidth = 12.w;
    backgroundPaint.strokeCap = StrokeCap.round;
    backgroundPaint.style = PaintingStyle.stroke;

    // final samplePaint = Paint();
    // samplePaint.color = Colors.red;
    // samplePaint.strokeWidth = 20;
    // samplePaint.strokeCap = StrokeCap.round;
    // samplePaint.style = PaintingStyle.stroke;



    canvas.drawLine(Offset.zero, Offset(size.width, 0), foregreoundPaint);
    canvas.drawLine(Offset.zero, Offset(size.width / progress, 0), backgroundPaint);
    // canvas.drawLine(Offset.zero, Offset(size.width / 4, 0), samplePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}