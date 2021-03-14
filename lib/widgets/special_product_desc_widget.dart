import 'dart:ui';

import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'form_field_widget.dart';

class SpecialProductDescWidget extends StatefulWidget {
  final Function(String) onSubmitClick;

  SpecialProductDescWidget({Key key, this.onSubmitClick}) : super(key: key);

  @override
  _SpecialProductDescWidgetState createState() =>
      _SpecialProductDescWidgetState();
}

class _SpecialProductDescWidgetState extends State<SpecialProductDescWidget> {
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        // width: MediaQuery.of(context).size.width * 0.8,
        // height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(right: 5,left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: kAccentColor,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  Text(
                    'بستن',
                    style: kMessageTextStyle.copyWith(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    child: Text(
                      'سفارشی سازی',
                      style: kTitleTextStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'توضیحات خود را در مورد سفارشی سازی این محصول برای فروشنده بیان کنید',
                    style: kMessageTextStyle.copyWith(color: kHintTextColor),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 10,
                    minLines: 5,
                    onChanged: (val) {
                      print(val);
                      description = val;
                    },
                    textDirection: TextDirection.rtl,
                    validator: (val) {
                      if (val.isEmpty || val.length < 10) {
                        return 'مقدار باید بیشتر از ۱۰ حرف باشد';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: kPrimaryColor))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    onPressed: () {
                      if(description.length >=10) {
                        widget.onSubmitClick(description);
                        Navigator.pop(context);
                      }
                      else
                        Helper.showMessageSnack(context,'خطا','مقدار باید بیشتر از ۱۰ حرف باشد');
                    },
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'تایید',
                      style: kTitleTextStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
