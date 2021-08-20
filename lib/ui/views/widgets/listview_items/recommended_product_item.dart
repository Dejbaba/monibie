import 'package:flutter/material.dart';
import 'package:monibie/core/models/dummy_product.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedProductItem extends StatelessWidget{

  final DummyProduct dummyProduct;
  final int index;
  RecommendedProductItem({Key key, this.dummyProduct, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Stack(
                children: [
                  Image.asset(dummyProduct.image),
                  index == 1 || index == 3 ? Container() : Positioned(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          color: dodgerBlue,
                          borderRadius: BorderRadius.all(Radius.circular(5),
                          )
                      ),
                      child: Text(
                        '31% OFF',
                        style: TextStyle(
                          fontFamily: "Gotham",
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 8.h,),
          Text(
            'Adidas Yeezy 380  v3 water resistant marking on the inner circumference',
            style: TextStyle(
              fontFamily: "GothamBook",
              color: metalBlack,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h,),
          Row(
            children: [
              Text(
                '₦35,000',
                style: TextStyle(
                  //fontFamily: "Gotham",
                  color: metalBlack,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              index == 1 || index == 2 ? Container() : SizedBox(
                width: 8.w,
              ),
              index == 1 || index == 2 ? Container() :  Text(
                '₦50,000',
                style: TextStyle(
                  //fontFamily: "Gotham",
                  color: dustyGrey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}