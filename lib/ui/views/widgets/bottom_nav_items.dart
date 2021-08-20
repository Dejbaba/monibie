import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/ui/shared/colors.dart';

///bottom nav items
userBottomTabItems(BuildContext context) {
  return [
    // new BottomNavigationBarItem(
    //   activeIcon: Container(
    //       //width: 90.w,
    //       padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
    //       decoration: BoxDecoration(
    //           color: snuffPurple,
    //           borderRadius: BorderRadius.all(Radius.circular(5))
    //       ),
    //       child: Column(
    //         children: [
    //           Icon(Icons.home, size: 35.w, color: daisyPurple,),
    //           SizedBox(height: 2.h,),
    //           Text("Home", style: TextStyle(
    //               fontSize: 10.sp,
    //               color: daisyPurple
    //           ),)
    //         ],
    //       )
    //   ),
    //   icon: Container(
    //       //width: 90.w,
    //       padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
    //       decoration: BoxDecoration(
    //           color: Colors.transparent,
    //           borderRadius: BorderRadius.all(Radius.circular(5))
    //       ),
    //       child: Column(
    //         children: [
    //           Icon(Icons.home_outlined, size: 30.w, color: metalBlack,),
    //           SizedBox(height: 3.h,),
    //           Text("Home", style: TextStyle(
    //               fontSize: 10.sp,
    //               color: daisyPurple
    //           ),)
    //         ],
    //       )
    //   ),
    //   label: "",
    // ),
    new BottomNavigationBarItem(
      activeIcon: Container(
        //width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: snuffPurple,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/home.png',
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(height: 5.h,),
              Text("Home", style: TextStyle(
                  fontSize: 10.sp,
                  color: daisyPurple
              ),)
            ],
          )
      ),
      icon: Container(
        //width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/home.png',
                height: 24.h,
                width: 24.w,
                color: metalBlack,
              ),
              SizedBox(height: 5.h,),
              Text("Home", style: TextStyle(
                  fontSize: 10.sp,
                  color: metalBlack
              ),)
            ],
          )
      ),
      label: "",
    ),
    new BottomNavigationBarItem(
      activeIcon: Container(
        //width: 90.w,
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: snuffPurple,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/categories.png',
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(height: 5.h,),
            Text("Categories", style: TextStyle(
              fontSize: 10.sp,
              color: daisyPurple
            ),)
          ],
        )
      ),
      icon: Container(
          //width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/categories.png',
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(height: 5.h,),
              Text("Categories", style: TextStyle(
                  fontSize: 10.sp,
                  color: metalBlack
              ),)
            ],
          )
      ),
      label: "",
    ),
    new BottomNavigationBarItem(
      activeIcon: Container(
          //width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: snuffPurple,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/chat.png',
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(height: 5.h,),
              Text("Chat", style: TextStyle(
                  fontSize: 10.sp,
                  color: daisyPurple
              ),)
            ],
          )
      ),
      icon: Container(
          //width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/chat.png',
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(height: 5.h,),
              Text("Chat", style: TextStyle(
                  fontSize: 10.sp,
                  color: metalBlack
              ),)
            ],
          )
      ),
      label: "",
    ),
    new BottomNavigationBarItem(
      activeIcon: Container(
          width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: snuffPurple,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/account.png',
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(height: 5.h,),
              Text("Account", style: TextStyle(
                  fontSize: 10.sp,
                  color: daisyPurple
              ),)
            ],
          )
      ),
      icon: Container(
          width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/account.png',
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(height: 5.h,),
              Text("Account", style: TextStyle(
                  fontSize: 10.sp,
                  color: metalBlack
              ),)
            ],
          )
      ),
      label: "",
    ),
  ];
}
