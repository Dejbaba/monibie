import 'package:flutter/material.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/ui/shared/colors.dart';

class CustomDot extends StatelessWidget{

  final bool isActive;

  const CustomDot({ this.isActive = true});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 8.h,
      width: 8.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)
      ),
      child: AnimatedContainer(
        //margin: EdgeInsets.all(2),
        duration: Duration(microseconds: 1),
        height: isActive ? 4.h
            : 4.h,
        width: isActive ? 4.w//40
            : 4.w,   //45
        decoration: BoxDecoration(
          color: isActive ? dodgerBlue : dustyGrey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }


}