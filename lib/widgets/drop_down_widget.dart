import 'dart:ui';

import 'package:decooj_buyers/generics/drop_down_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String hint;
  final List<DropDownModel> items;
  final DropDownModel currentVal;
  final Function(DropDownModel item) onSelectItem;
  final double width;

  const DropDownWidget(
      {@required this.hint,
      @required this.items,
      this.currentVal,
        this.width,
      this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 10.0,left: 10.0,),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(color: kHintTextColor),
          borderRadius: BorderRadius.circular(10)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButton<DropDownModel>(

          underline: Container(),
          isExpanded: true,
          value: currentVal,
          icon:  Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 30,
          elevation: 16,
          style:kTitleTextStyle.copyWith(color: kHintTextColor),
          hint: Text(hint ,style: TextStyle(color: kHintTextColor),),

          onChanged: (DropDownModel newValue) {
            onSelectItem(newValue);
          },
          items: items.map<DropdownMenuItem<DropDownModel>>(
            (DropDownModel value) {
              return DropdownMenuItem<DropDownModel>(
                value: value,
                child: Text(value.txt),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
