import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/ui/shared/colors.dart';

import 'custom_progress_bar.dart';

class ReviewStatRow extends StatelessWidget {

  final String number;
  final String percentage;
  final Color activecolor;
  final double progress;
  ReviewStatRow({Key key, this.number = "5", this.percentage = "65%", this.progress, this.activecolor = malachiteGreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          number,
          style: TextStyle(
              fontFamily: "GothamBook",
              fontSize: 14.sp,
              color: metalBlack,
              fontWeight: FontWeight.w300
          ),
        ),
        SizedBox(width: 12.w,),
        Container(
          width: 147.w,
          child: CustomPaint(
            painter: CustomProgressBar(
                activeColor: activecolor,
                progress: progress
            ),
          ),
        ),
        SizedBox(width: 12.w,),
        Text(
          percentage,
          style: TextStyle(
              fontFamily: "GothamBook",
              fontSize: 14.sp,
              color: metalBlack,
              fontWeight: FontWeight.w300
          ),
        ),
      ],
    );
  }
}
