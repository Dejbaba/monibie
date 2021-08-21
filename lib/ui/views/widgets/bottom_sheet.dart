

import 'package:flutter/material.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:monibie/ui/views/widgets/quantity_selection.dart';

///bottom sheet
bottomSheet({BuildContext context}){

  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: Container(
            height: 758.h,
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 16.h, bottom: 40.h),
            width: width(context),
            color: Colors.transparent,
            child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Colour / Size Option",
                          style: TextStyle(
                            fontFamily: "GothamMedium",
                              fontSize: 20.sp,
                              color: metalBlack,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        InkResponse(
                          onTap: ()=> Navigator.pop(context),
                          child: Text(
                            "Close",
                            style: TextStyle(
                                fontFamily: "GothamMedium",
                                fontSize: 16.sp,
                                color: havelockBlue,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h,),
                    Text(
                      "SELECT COLOUR:",
                      style: TextStyle(
                          fontFamily: "GothamMedium",
                          fontSize: 14.sp,
                          color: metalBlack,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      children: List.generate(2, (index) => Container(
                        margin: EdgeInsets.only(right: 16.w),
                        height: 74.h,
                        width: 74.w,
                        child: Image.asset("assets/images/shoe.png", fit: BoxFit.contain,),
                      )),
                    ),
                    SizedBox(height: 32.h,),
                    Text(
                      "SELECT SIZE:",
                      style: TextStyle(
                          fontFamily: "Gotham",
                          fontSize: 14.sp,
                          color: metalBlack,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 16.h,),
                    Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 15.w,
                        runSpacing: 15.h,
                        direction: Axis.horizontal,
                        children: List.generate(dummySize.length, (index) => Container(
                          height: 57.h,
                          width: 57.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: nobelGrey, width: 2.w
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child:Center(
                            child: Text(
                              "${dummySize[index]}",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: metalBlack),
                            ),
                          ),
                        ))
                    ),
                    SizedBox(height: 31.h,),
                    QuantitySelection(),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 137.w,
                          height: 48.h,
                          child: TextButton(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                fontFamily: "Gotham",
                                color: metalBlack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            style: TextButton.styleFrom(
                              backgroundColor: selectiveYellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 145.w,
                          height: 48.h,
                          child: TextButton(
                            child: Text(
                              'Buy now',
                              style: TextStyle(
                                fontFamily: "Gotham",
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            style: TextButton.styleFrom(
                              backgroundColor: daisyPurple,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                            ),
                            onPressed: () {}

                          ),
                        ),
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: BoxDecoration(
                              color: galleryGrey,
                              shape: BoxShape.circle),
                          child: Center(
                            child: Image.asset(
                              "assets/images/telephone.png",
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ),
        );
      });
}