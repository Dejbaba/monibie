import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monibie/core/viewmodels/quantity_selection_model.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:provider/provider.dart';

class QuantitySelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuantitySelectionModel>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "QUANTITY:",
                style: TextStyle(
                    fontFamily: "Gotham",
                    fontSize: 16.sp,
                    color: metalBlack,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(width: 14.w,),
              Text(
                "${model.quantity}",
                style: TextStyle(
                    fontFamily: "Gotham",
                    fontSize: 16.sp,
                    color: metalBlack,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(width: 11.w,),
              Container(
                width: 128.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                    border: Border.all(color: dustyGrey, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkResponse(
                      onTap: model.disableDecrement ? null : ()=> model.decrementQuantity(),
                      child: Container(
                        height: 32.h,
                        width: 32.w,
                        child: Image.asset("assets/images/minus.png", color: model.disableDecrement ? altoGrey : metalBlack,),
                      ),
                    ),
                    Text(
                      "${model.quantityCounter}",
                      style: TextStyle(
                          fontFamily: "Gotham",
                          fontSize: 16.sp,
                          color: metalBlack,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    InkResponse(
                      onTap: model.disableIncrement ? null : ()=> model.incrementQuantity(),
                      child: Container(
                        height: 32.h,
                        width: 32.w,
                        child: Image.asset("assets/images/plus.png", color: model.disableIncrement ? altoGrey : metalBlack,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 34.h,),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: metalBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: "PRICE:   ", style: TextStyle(fontFamily: "Gotham",),
                ),
                TextSpan(
                  text: "₦${model.returnAmount(addDecimal: false)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
