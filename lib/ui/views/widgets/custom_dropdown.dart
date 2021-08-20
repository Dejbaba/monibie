
import 'package:flutter/material.dart';
import 'package:monibie/core/constants/app_constants.dart';
import 'package:monibie/ui/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final String dropdownValue;
  final List<String> items;
  final Function onChanged;
  final Color dropIconColor;
  final Color hintTextColor;
  final Color bgColor;
  final Color borderColor;
  final IconData dropDownIcon;
  @required final String hintText;
  final String dropDownLabel;

  const CustomDropDown({
    Key key,
    // @required this.child,
    this.items,
    this.onChanged,
    this.dropdownValue,
    this.hintText,
    this.dropIconColor,
    this.hintTextColor,
    this.dropDownLabel,
    this.bgColor = Colors.white,
    this.borderColor = metalBlack,
    this.dropDownIcon = Icons.arrow_drop_down
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Padding(
            padding: EdgeInsets.only(bottom: height(context) / 100),
            child: Text(dropDownLabel,style: TextStyle(color: Colors.grey, fontSize: width(context) / 30),),
          ),*/
          Container(
            height: height(context) / 17,
            width: width(context),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: borderColor, width: 0.5)),
            child: DropdownButtonHideUnderline (
              child: DropdownButton<String>(
                style: TextStyle(
                  fontFamily: "GothamMedium",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
                isExpanded: true,
                hint: Padding(
                  padding:  EdgeInsets.only(left: 16.sp,),
                  child: Text(hintText,
                    style: TextStyle(fontSize: 14.sp, fontFamily: "Avenir",
                        fontWeight: FontWeight.w500, color: hintTextColor),),
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(dropDownIcon, color: dropIconColor,),
                ),
                value: dropdownValue,
                onChanged:onChanged,
                items: items
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(value),
                    ),
                  );
                })
                    .toList(),
              ),
            ),
          ),
        ],

      ),
    );
  }
}