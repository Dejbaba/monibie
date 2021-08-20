import 'package:flutter/material.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/ui/shared/colors.dart';

class CustomDot extends StatelessWidget{

  final bool isActive;
  final bool fromProductScreen;
  final double outerSize;
  final Color activeColor;
  final Color inactiveColor;
  final double innerSize;

  const CustomDot({ this.fromProductScreen = false, this.isActive = true, this.outerSize = 8, this.innerSize = 4, this.activeColor = dodgerBlue, this.inactiveColor = dustyGrey});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: outerSize.h,
      width: outerSize.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        color: fromProductScreen && isActive ? activeColor : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: fromProductScreen && isActive ? activeColor : Colors.white, width: fromProductScreen ? 3 : 1)
      ),
      child: AnimatedContainer(
        //margin: EdgeInsets.all(2),
        duration: Duration(microseconds: 1),
        height: isActive ? innerSize.h
            : innerSize.h,
        width: isActive ? 4.w//40
            : innerSize.w,   //45
        decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }


}