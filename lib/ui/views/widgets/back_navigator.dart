import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()=> Navigator.pop(context),
        child: Center(child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Image.asset("assets/images/back_arrow.png", height: 23.83.h, width: 30.6.w,),
        )));
  }
}
