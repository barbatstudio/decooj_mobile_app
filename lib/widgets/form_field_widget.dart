import 'dart:ui';

import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class FormFieldWidget extends StatelessWidget {
  final TextFormField textField;
  final String label;

  const FormFieldWidget({Key key, this.textField, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(


        margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label,style: kMessageTextStyle.copyWith(color: kPrimaryColor),textAlign: TextAlign.end,),
          SizedBox(height: 2,),
          textField,
        ],
      ) ,

      
    );
  }
}
