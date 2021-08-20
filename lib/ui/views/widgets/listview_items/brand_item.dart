import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:monibie/core/models/dummy_brand.dart';

class BrandItem extends StatelessWidget{

  final DummyBrand dummyBrand;
  BrandItem({Key key, this.dummyBrand}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height(context),
      padding: EdgeInsets.symmetric(horizontal: 12.04.w, vertical: 16.h),
      width: 140.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Image.asset(dummyBrand.brandLogo, height: 37.63.h, width: 115.91.w,),
          SizedBox(height: 4.13.h,),
          Image.asset(dummyBrand.sampleProduct, height: 66.24.h, width: 66.24.w,),

        ],
      ),
    );
  }


}