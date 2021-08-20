
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:monibie/core/viewmodels/app_bar_model.dart';
import 'package:monibie/core/viewmodels/bottom_nav_model.dart';
import 'package:monibie/core/viewmodels/slider_model.dart';
import 'package:monibie/ui/views/widgets/custom_dot.dart';
import 'package:monibie/ui/views/widgets/listview_items/brand_item.dart';
import 'package:monibie/ui/views/widgets/listview_items/recommended_product_item.dart';
import 'package:monibie/ui/views/widgets/listview_items/slider_item.dart';
import 'package:monibie/ui/views/widgets/listview_items/top_selling_item.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../shared/colors.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();

      _scrollController.addListener(() {
        if (_scrollController.position.pixels >
            _scrollController.position.minScrollExtent) {
          Provider.of<AppBarModel>(context, listen:false).updateParentColor(value: false);
        }else{
          Provider.of<AppBarModel>(context, listen:false).updateParentColor(value: true);
        }
      });

  }
  @override
  Widget build(BuildContext context) {

    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.only(left: 16.w, right: 15.w, bottom: 107.h,),
      children: [
        homeSlider(context),
        SizedBox(height: 8.h,),
        topSellingItems(context),
        SizedBox(height: 16.h,),
        Text(
          'Popular Categories',
          style: TextStyle(
            fontFamily: "Gotham",
            color: metalBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h,),
        electronics(context),
        SizedBox(height: 8.h,),
        beautyAndHealth(context),
        SizedBox(height: 8.h,),
        phoneAndTablets(context),
        SizedBox(height: 8.h,),
        phoneAccessories(context),
        SizedBox(height: 16.h,),
        flashSales(context),
        SizedBox(height: 16.h,),
        Text(
          'Top Brands',
          style: TextStyle(
            fontFamily: "Gotham",
            color: metalBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16.h,),
        topBrands(context),
        SizedBox(height: 16.h,),
        Text(
          'Recommended for you',
          style: TextStyle(
            fontFamily: "Gotham",
            color: metalBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16.h,),
        GridView.builder(
            padding: EdgeInsets.zero,
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
                dummyProduct: dummyRecommendedProducts[index],
              );
            }),




      ],
    );

  }

  ///horizontal slider on home screen
  homeSlider(BuildContext context) =>  SafeArea(
    child: Consumer<SliderModel>(
      builder: (context, model, child) => Stack(
        children: [
          Container(
            height: 151.h,
            width: width(context),
            child: Swiper(
              itemCount: dummySliders.length,
              curve: Curves.linearToEaseOut,
              itemHeight: height(context),
              itemWidth: width(context),
              //layout: SwiperLayout.DEFAULT,
              onIndexChanged: (index) => model.updateIndex(index: index),
              itemBuilder:
                  (BuildContext context, int index) {
                return SliderItem(
                  image: dummySliders[index],
                );
              },
            ),
          ),
          Positioned.fill(
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 10.w, right: 5.w, top: 4.h, bottom: 4.h),
                  margin: EdgeInsets.only(bottom: 7.h),
                  decoration: BoxDecoration(
                      color: dustyGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(dummySliders.length, (index) => CustomDot(
                      isActive: model.index == index,
                    )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  ///top selling items
  topSellingItems(BuildContext context) =>  Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top selling items',
          style: TextStyle(
            fontFamily: "Gotham",
            color: metalBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h,),
        Container(
          height: 200.h,
          child: ListView.separated(
            //padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            itemCount: dummyTopSellingItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return TopSellingItem(image: dummyTopSellingItems[index],);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w,);
            },
          ),
        ),

      ],
    ),
  );

  ///electronics(popular category)
  electronics(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(dummyElectronics.length, (index) => Container(
            height: 104.h,
            width: 104.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(dummyElectronics[index])),
          )),
        ),
        SizedBox(height: 4.h,),
        Text(
          'Electronics',
          style: TextStyle(
            fontFamily: "GothamMedium",
            color: metalBlack,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

      ],
    ),
  );

  ///beauty&health(popular category)
  beautyAndHealth(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(dummyElectronics.length, (index) => Container(
            height: 104.h,
            width: 104.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(dummyElectronics[index])),
          )),
        ),
        SizedBox(height: 4.h,),
        Text(
          'Beauty & Health',
          style: TextStyle(
            fontFamily: "GothamMedium",
            color: metalBlack,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

      ],
    ),
  );


  ///phones & tablets(popular category)
  phoneAndTablets(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(dummyPhones.length, (index) => Container(
            height: 104.h,
            width: 104.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(dummyPhones[index])),
          )),
        ),
        SizedBox(height: 4.h,),
        Text(
          'Phones & Tablets',
          style: TextStyle(
            fontFamily: "GothamMedium",
            color: metalBlack,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

      ],
    ),
  );

  ///phone accessories(popular category)
  phoneAccessories(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(dummyPhones.length, (index) => Container(
            height: 104.h,
            width: 104.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(dummyPhones[index])),
          )),
        ),
        SizedBox(height: 4.h,),
        Text(
          'Phone Accessories',
          style: TextStyle(
            fontFamily: "GothamMedium",
            color: metalBlack,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

      ],
    ),
  );

  ///flash sales
  flashSales(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Flash Sales',
              style: TextStyle(
                fontFamily: "Gotham",
                color: metalBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 8.w,),
            Container(
                height: 18.h,
                width: 18.w,
                decoration: BoxDecoration(
                    color: orangeRed,
                    shape: BoxShape.circle),
                child: Center(child: Icon(Icons.bolt, color: Colors.white, size: 16,))
            ),
            SizedBox(width: 24.w,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
              decoration: BoxDecoration(
                  color: metalBlack,
                  borderRadius: BorderRadius.all(Radius.circular(5),
                  )
              ),
              child: Text(
                '24',
                style: TextStyle(
                  fontFamily: "Gotham",
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Text(
              ':',
              style: TextStyle(
                fontFamily: "Gotham",
                color: metalBlack,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
              decoration: BoxDecoration(
                  color: metalBlack,
                  borderRadius: BorderRadius.all(Radius.circular(5),
                  )
              ),
              child: Text(
                '34',
                style: TextStyle(
                  fontFamily: "Gotham",
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Text(
              ':',
              style: TextStyle(
                fontFamily: "Gotham",
                color: metalBlack,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
              decoration: BoxDecoration(
                  color: metalBlack,
                  borderRadius: BorderRadius.all(Radius.circular(5),
                  )
              ),
              child: Text(
                '58',
                style: TextStyle(
                  fontFamily: "Gotham",
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

          ],
        ),

        SizedBox(height: 10.h,),
        Container(
          height: 200.h,
          child: ListView.separated(
            //padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            itemCount: dummyTopSellingItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return TopSellingItem(image: dummyTopSellingItems[index], isTopSellingItem: false,);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w,);
            },
          ),
        ),

      ],
    ),
  );

  ///top brands
  topBrands(BuildContext context) => Container(
    height: 140.h,
    child: ListView.separated(
      itemCount: dummyBrands.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return BrandItem(dummyBrand: dummyBrands[index],);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 8.w,);
      },
    ),
  );
}
