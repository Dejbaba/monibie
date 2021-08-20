import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:monibie/ui/shared/colors.dart';

class TopSellingItem extends StatelessWidget {
  final String image;
  final bool isTopSellingItem;
  TopSellingItem({Key key, this.image, this.isTopSellingItem = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context),
      width: 140.w,
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
            height: 8.h,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isTopSellingItem ? '₦3,400' : "₦400",
                style: TextStyle(
                  //fontFamily: "Gotham",
                  color: metalBlack,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: isTopSellingItem? 10.w : 8.w,
              ),
              isTopSellingItem
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                          color: dodgerBlue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/trending.png",
                            width: 12.w,
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'Top',
                            style: TextStyle(
                              fontFamily: "Gotham",
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      '₦1,500',
                      style: TextStyle(
                        //fontFamily: "Gotham",
                        color: dustyGrey,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14.sp,
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
