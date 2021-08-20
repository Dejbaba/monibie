
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:monibie/core/viewmodels/app_bar_model.dart';
import 'package:monibie/core/viewmodels/bottom_nav_model.dart';
import 'package:monibie/ui/views/widgets/bottom_nav_items.dart';
import 'package:monibie/core/viewmodels/bottom_nav_model.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:provider/provider.dart';
import 'package:monibie/ui/views/widgets/bottom_nav_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/colors.dart';




class BottomNav extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> {

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavModel, AppBarModel>(
        builder: (context, model, appBarModel, child) => Scaffold(
          backgroundColor: concreteGrey,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              color: appBarModel.switchColor ? Colors.white : Colors.transparent,
              child: appBarModel.switchColor ? Container(
                padding: EdgeInsets.only(
                  left: 16.w, right: 19.w
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          right: 5.w, top: 5.h, bottom: 5.h, left: 16.w
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: metalBlack),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 30.h,
                              width: width(context) / 2,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: width(context) / 20,
                                      vertical: height(context) / 40),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelText: "Search for a product",
                                  //contentPadding: EdgeInsets.only(bottom: height(context) / 100, left: width(context) / 30),
                                  labelStyle: TextStyle(
                                      fontSize: width(context) / 30,
                                      color: metalBlack.withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Avenir"),
                                ),
                                style: TextStyle(
                                    fontSize: width(context) / 30, color: metalBlack, fontFamily: "Avenir"),
                              ),
                            ),
                            Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                color: electricPurple,
                              ),
                              child: Center(child: Icon(Icons.search,color: Colors.white, size: 20,)),
                            ),

                          ],
                        ),
                      ),
                      Badge(
                          badgeColor: internationalOrange,
                          shape: BadgeShape.circle,
                          showBadge: true,
                          toAnimate: false,
                          badgeContent: Container(
                              child: Center(
                                child: Text(
                                  "15",
                                  style: TextStyle(
                                      fontFamily: "GothamBook",
                                      fontSize: 8.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              )),
                          child: Image.asset("assets/images/cart.png", height: 32.h,width: 32.w,))
                    ],
                  ),
                ),
              ) : ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                      child: Container(
                        //color: Colors.yellow,
                        padding: EdgeInsets.only(
                            left: 16.w, right: 19.w
                        ),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    right: 5.w, top: 5.h, bottom: 5.h, left: 16.w
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: metalBlack),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30.h,
                                      width: width(context) / 2,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: height(context) / 40),
                                          labelText: "Search for a product",
                                          //contentPadding: EdgeInsets.only(bottom: height(context) / 100, left: width(context) / 30),
                                          labelStyle: TextStyle(
                                              fontSize: width(context) / 30,
                                              color: metalBlack.withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Avenir"),
                                        ),

                                        style: TextStyle(
                                            fontSize: width(context) / 30, color: metalBlack, fontFamily: "Avenir"),
                                      ),
                                    ),
                                    Container(
                                      height: 32.h,
                                      width: 32.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: electricPurple,
                                      ),
                                      child: Center(child: Icon(Icons.search,color: Colors.white, size: 20,)),
                                    ),

                                  ],
                                ),
                              ),
                              Badge(
                                  badgeColor: internationalOrange,
                                  shape: BadgeShape.circle,
                                  showBadge: true,
                                  toAnimate: false,
                                  badgeContent: Container(
                                      child: Center(
                                        child: Text(
                                          "15",
                                          style: TextStyle(
                                              fontFamily: "GothamBook",
                                              fontSize: 8.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      )),
                                  child: Image.asset("assets/images/cart.png", height: 32.h,width: 32.w,))
                            ],
                          ),
                        ),
                      ))),
            ),
            preferredSize: Size(width(context), 80.h),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0.75), // changes position of shadow
                ),
              ],
            ),
            child: BottomNavigationBar(
                onTap: (index) =>  model.updateIndex(index),
                type: BottomNavigationBarType.fixed,
                elevation: 10,
                backgroundColor: Colors.white,
                currentIndex: model.currentIndex,
                items: userBottomTabItems(context)),
          ),
          body: SafeArea(
            top: false,
              child: IndexedStack(index: model.currentIndex, children: model.children)),
        ),
      );

  }













}


