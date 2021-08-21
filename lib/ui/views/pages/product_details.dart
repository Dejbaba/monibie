import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:monibie/core/viewmodels/app_bar_model.dart';
import 'package:monibie/core/viewmodels/slider_model.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:monibie/ui/views/widgets/bottom_sheet.dart';
import 'package:monibie/ui/views/widgets/custom_dot.dart';
import 'package:monibie/ui/views/widgets/custom_dropdown.dart';
import 'package:monibie/ui/views/widgets/custom_progress_bar.dart';
import 'package:monibie/ui/views/widgets/listview_items/recommended_product_item.dart';
import 'package:monibie/ui/views/widgets/listview_items/slider_item.dart';
import 'package:monibie/ui/views/widgets/review_stat_row.dart';
import 'package:monibie/ui/views/widgets/star_rating.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();

    _scrollListener();
  }

  _scrollListener() {
     _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.minScrollExtent) {
        Provider.of<AppBarModel>(context, listen:false).updateColor(value: false);
      }else{
        Provider.of<AppBarModel>(context, listen:false).updateColor(value: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: concreteGrey,
        extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: Consumer<AppBarModel>(
          builder: (context, model, child) => Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            color: model.switchColor2 ? Colors.white : Colors.transparent,
            child: model.switchColor2 ? Container(
              padding: EdgeInsets.only(
                  left: 16.w, right: 19.w, bottom: 5.h
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkResponse(
                      onTap: ()=> Navigator.pop(context),
                        child: Image.asset("assets/images/left-arrow.png", height: 32.h, width: 32.w,)),
                    Text(
                      "Details",
                      style: TextStyle(
                          fontFamily: "Gotham-Bold",
                          fontSize: 18.sp,
                          color: metalBlack,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      children: [
                      Image.asset("assets/images/home-button.png", height: 32.h, width: 32.w,),
                        SizedBox(width: 19.w,),
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
                    ],),

                  ],
                ),
              ),
            ) : ClipRRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(
                      //color: Colors.yellow,
                      padding: EdgeInsets.only(
                          left: 16.w, right: 19.w, bottom: 5.h
                      ),
                      child: SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkResponse(
                                onTap: ()=> Navigator.pop(context),
                                child: Image.asset("assets/images/left-arrow.png", height: 32.h, width: 32.w,)),
                            Text(
                              "Details",
                              style: TextStyle(
                                  fontFamily: "Gotham-Bold",
                                  fontSize: 18.sp,
                                  color: metalBlack,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/home-button.png", height: 32.h, width: 32.w,),
                                SizedBox(width: 19.w,),
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
                              ],),

                          ],
                        ),
                      ),
                    ))),
          ),
        ),
        preferredSize: Size(width(context), 100.h),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: 50.h),
              children: [
                productImage(context),
                SizedBox(height: 4.h,),
                priceDescription(context),
                SizedBox(height: 4.h,),
                colorDescription(context),
                SizedBox(height: 4.h,),
                shippingDescription(context),
                SizedBox(height: 4.h,),
                sellerDescription(context),
                SizedBox(height: 4.h,),
                description(context),
                SizedBox(height: 4.h,),
                review(context),
                SizedBox(height: 12.h,),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      fontFamily: "Gotham-Bold",
                      color: metalBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),
                GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //controller: new ScrollController(keepScrollOffset: false),
                    itemCount: dummyRecommendedProducts.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: aspectRatio(context) * 1.2),
                    itemBuilder: (BuildContext context, int index) {
                      return RecommendedProductItem(
                        index: index,
                        fromProductDetailsScreen: true,
                        dummyProduct: dummyRecommendedProducts[index],
                      );
                    }),
              ],
            ),
          ),
          bottomDock(context)
        ],
      )
    );
  }

  ///bottom dock
  bottomDock(BuildContext context) => Container(
    padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 8.h,
        bottom: 40.h
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 0.75), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 137.w,
          height: 48.h,
          child: TextButton(
            child: Text(
              'Add to cart',
              style: TextStyle(
                fontFamily: "GothamMedium",
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
            onPressed: () => bottomSheet(
                context: context,
            ),
          ),
        ),
        Container(
          width: 145.w,
          height: 48.h,
          child: TextButton(
            child: Text(
              'Buy now',
              style: TextStyle(
                fontFamily: "GothamMedium",
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
            onPressed: () => bottomSheet(
              context: context,
            ),
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
  );

  ///horizontal slider on home screen
  productImage(BuildContext context) =>  SafeArea(
    child: Consumer<SliderModel>(
      builder: (context, model, child) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 439.h,
                  width: width(context),
                  child: Swiper(
                    itemCount: dummyProductImages.length,
                    curve: Curves.linearToEaseOut,
                    itemHeight: height(context),
                    itemWidth: width(context),
                    //layout: SwiperLayout.DEFAULT,
                    onIndexChanged: (index) => model.updateImageIndex(index: index),
                    itemBuilder:
                        (BuildContext context, int index) {
                      return Image.asset(dummyProductImages[index],fit: BoxFit.cover,);
                    },
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(left: 10.w, right: 5.w, top: 4.h, bottom: 4.h),
                        margin: EdgeInsets.only(bottom: 26.h),
                        decoration: BoxDecoration(
                            color: dustyGrey.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(dummyProductImages.length, (index) => CustomDot(
                            isActive: model.imageIndex == index,
                            fromProductScreen: true,
                            inactiveColor: dustyGrey.withOpacity(0.3),
                            activeColor: pizazzOrange,
                            outerSize: 12,
                            innerSize: 4,

                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Ted Head Design Cool Cotton 2019 Free Size Round Neck Polo Shirt',
                style: TextStyle(
                  fontFamily: "GothamBold",
                  color: metalBlack,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),

          ],
        ),
      )
    ),
  );

  ///price description
  priceDescription(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.only(
        left: 16.w, top: 16.h, bottom: 16.h
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "₦21,000 - 32,000",
          style: TextStyle(
            //fontFamily: "GothamBook",
              fontSize: 20.sp,
              color: metalBlack,
              fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 6.h,),
        Row(
          children: [
            Text(
              '₦10,000',
              style: TextStyle(
                //fontFamily: "Gotham",
                color: dustyGrey,
                decoration: TextDecoration.lineThrough,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 11.w,),
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                  color: mediumPurple,
                  borderRadius: BorderRadius.all(Radius.circular(5),
                  )
              ),
              child: Text(
                '31% OFF',
                style: TextStyle(
                  fontFamily: "Gotham",
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );

  ///color description
  colorDescription(BuildContext context) => Container(
    padding: EdgeInsets.only(left: 16.w, right: 15.w, top: 16.h, bottom: 16.h),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Select Colour, Size",
          style: TextStyle(
            //fontFamily: "GothamBook",
              fontSize: 16.sp,
              color: metalBlack,
              fontWeight: FontWeight.w700
          ),
        ),
        Text(
          "Select",
          style: TextStyle(
              fontFamily: "GothamMedium",
              fontSize: 16.sp,
              color: orangeRed,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    ),
  );

  ///shipping description
  shippingDescription(BuildContext context) => Container(
    padding: EdgeInsets.only(left: 16.w, right: 15.w, top: 16.h, bottom: 16.h),
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, color: malachiteGreen, size: 20,),
        SizedBox(width: 6.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shipping to your state",
              style: TextStyle(
                fontFamily: "Gotham-Bold",
                  fontSize: 16.sp,
                  color: metalBlack,
                  fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 8.h,),
            Text(
              "Estimated day of delivery: 2-3 days",
              style: TextStyle(
                  fontFamily: "GothamMedium",
                  fontSize: 16.sp,
                  color: metalBlack,
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),


      ],
    ),
  );

  ///seller discription
  sellerDescription(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64.h,
          width: 64.w,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            "assets/images/avatar.png",
            height: 64.h,
            width: 64.w,
          ),
        ),
        SizedBox(width: 18.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pro & Sons Designs Store limited...",
                style: TextStyle(
                    fontFamily: "Gotham-Bold",
                    fontSize: 14.sp,
                    color: metalBlack,
                    fontWeight: FontWeight.w700
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 9.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/chat.png", height: 18.h, width: 18.w, color: heartPurple,),
                      SizedBox(width: 8.w,),
                      Text(
                        "chat seller",
                        style: TextStyle(
                            fontFamily: "GothamBook",
                            fontSize: 14.sp,
                            color: heartPurple,
                            fontWeight: FontWeight.w300
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: metalBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: "225k ",
                          ),
                          TextSpan(
                            text: "Followers",
                            style: TextStyle(
                              fontFamily: "GothamMedium",
                              fontWeight: FontWeight.w300,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 26.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 88.w,
                    height: 32.h,
                    child: OutlinedButton(
                      child: Text(
                        'FOLLOW',
                        style: TextStyle(
                          fontFamily: "Gotham-Bold",
                          color: daisyPurple,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: daisyPurple, width: 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                  Container(
                    width: 152.w,
                    height: 32.h,
                    child: TextButton(
                      child: Text(
                          'VISIT STORE',
                          style: TextStyle(
                            fontFamily: "Gotham-Bold",
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      style: TextButton.styleFrom(
                        backgroundColor: daisyPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(100))),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  ///description
  description(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
              fontFamily: "Gotham-Bold",
              fontSize: 16.sp,
              color: metalBlack,
              fontWeight: FontWeight.w700
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h,),
        Text(
          "This Men's white, slim fitted shirt is designed with an elegant single button pointed collar and 2 button single cuffs. Finer details include stripe contrast detail on the inner collar and inner cuffs. Our fitted shirts have been flatteringly designed with darts at the waist and bust, creating a streamlined silhouette.",
          style: TextStyle(
              fontFamily: "GothamBook",
              fontSize: 15.sp,
              color: metalBlack.withOpacity(0.6),
              fontWeight: FontWeight.w300
          ),
        ),
        Container(
          height: 216.h,
          width: width(context),
          child: Image.asset("assets/images/description_1.png", fit: BoxFit.fitWidth,),
        ),
        Container(
          height: 183.h,
          width: width(context),
          child: Row(
            children: [
              Expanded(
                child: Image.asset("assets/images/description_2.png", fit: BoxFit.fitWidth,),
              ),
              Expanded(
                child: Image.asset("assets/images/description_3.png", fit: BoxFit.fitWidth,),
              ),
            ],
          ),
        ),
        Container(
          height: 183.h,
          width: width(context),
          child: Image.asset("assets/images/description_4.png", fit: BoxFit.fitWidth,),
        ),
        Container(
          height: 243.h,
          width: width(context),
          child: Image.asset("assets/images/description_5.png", fit: BoxFit.fitWidth,),
        ),

      ],
    ),
  );

  ///review
  review(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Row(
         children: [
           Text(
             "Review (30)",
             style: TextStyle(
                 fontFamily: "Gotham-Bold",
                 fontSize: 16.sp,
                 color: metalBlack,
                 fontWeight: FontWeight.w700
             ),
           ),
           SizedBox(width: 11.w,),
           StarRating(
             value: 3,
             starHeight: 20.h,
           ),
         ],
       ),
        SizedBox(height: 24.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 64.h,
                  width: 64.w,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/images/rating-star.png",
                    height: 64.h,
                    width: 64.w,
                  ),
                ),
                SizedBox(height: 8.h,),
                Text(
                  "Average rating",
                  style: TextStyle(
                      fontFamily: "GothamMedium",
                      fontSize: 14.sp,
                      color: metalBlack,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 8.h,),
                Text(
                  "450 Reviews",
                  style: TextStyle(
                      fontFamily: "GothamBook",
                      fontSize: 12.sp,
                      color: metalBlack,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
            SizedBox(width: 30.w,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReviewStatRow(
                    activecolor: malachiteGreen,
                    number: "5",
                    percentage: "65%",
                    progress: 1.2,
                  ),
                  SizedBox(height: 14.h,),
                  ReviewStatRow(
                    activecolor: pizazzOrange,
                    number: "4",
                    percentage: "20%",
                    progress: 2,
                  ),
                  SizedBox(height: 14.h,),
                  ReviewStatRow(
                    activecolor: metalBlack,
                    number: "3",
                    percentage: "10%",
                    progress: 5,
                  ),
                  SizedBox(height: 14.h,),
                  ReviewStatRow(
                    activecolor: dustyGrey,
                    number: "2",
                    percentage: "  5%",
                    progress: 15,
                  ),
                  SizedBox(height: 14.h,),
                  ReviewStatRow(
                    activecolor: dustyGrey,
                    number: "1",
                    percentage: "  2%",
                    progress: 20,
                  ),


                ],
              ),

          ],
        ),
        SizedBox(height: 25.h,),
        Container(
          width: width(context),
          height: 48.h,
          child: TextButton(
            child: Text(
              'WRITE A REVIEW',
              style: TextStyle(
                fontFamily: "Gotham-Bold",
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
            onPressed: () {},
          ),
        ),
        SizedBox(height: 24.h,),
        Container(
          color: galleryGrey,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: CustomDropDown(
            dropDownLabel: "Sort by recent",
            hintText: 'Select Document Type',
            hintTextColor: dustyGrey,
            dropIconColor: dustyGrey,
            onChanged: (String value) {

            },
            //dropdownValue: _profession2,
            items: ["Sample data A", "Sample data B"],
          ),
        ),
        SizedBox(height: 24.h,),
        Column(
          children: List.generate(2, (index) => Padding(
            padding: EdgeInsets.only(bottom: index == 1 ? 0 : 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/account-filled.png", height: 32.h, width: 32.w,),
                    SizedBox(width: 8.w,),
                    Text(
                      "Michael Pro",
                      style: TextStyle(
                          fontFamily: "GothamMedium",
                          fontSize: 16.sp,
                          color: metalBlack,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    StarRating(
                      value: 3,
                      starHeight: 15.h,
                    ),
                  ],
                ),
                SizedBox(height: 14.h,),
                Text(
                  "This Men's white, slim fitted shirt is designed with an elegant single button pointed collar and 2 button single cuffs. Finer details include stripe contrast detail on the inner collar and inner cuffs. Our fitted shirts have been flatteringly designed with darts at the waist and bust, creating a streamlined silhouette.",
                  style: TextStyle(
                      fontFamily: "GothamBook",
                      fontSize: 14.sp,
                      color: metalBlack.withOpacity(0.6),
                      fontWeight: FontWeight.w300
                  ),
                ),
                SizedBox(height: 8.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
                  decoration: BoxDecoration(
                    color: peach,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(dummyScreenShots.length, (index) => Container(
                          margin: EdgeInsets.only(right: 8.w),
                          height: 43.h,
                          width: 43.w,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.asset(dummyScreenShots[index], fit: BoxFit.contain,)),
                        )),
                      ),
                      SizedBox(height: 12.h,),
                      Text(
                        'Reviewed on 22/01/2019',
                        style: TextStyle(
                          fontFamily: "GothamBook",
                          color: dustyGrey.withOpacity(0.6),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
        SizedBox(height: 21.h,),
        Align(
          alignment: Alignment.center,
            child: Icon(Icons.arrow_drop_down_sharp, color: dustyGrey, size: 35.w,)),
      ],
    ),
  );
}
