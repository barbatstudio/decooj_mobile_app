import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';

class NumberPickerWidget extends StatelessWidget {

  final int currentValue;
  final Function onIncrease;
  final Function onDecrease;
  final String hint;

  const NumberPickerWidget({Key key, this.currentValue, this.onIncrease, this.onDecrease, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *0.2,
      padding: EdgeInsets.only(left: 5.0,right: 5),
      decoration: BoxDecoration(
        border: Border.all(color: kHintTextColor),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: GestureDetector(
                    onTap: onIncrease,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: kPrimaryColor,
                      size: 20.0,
                    )),
              ),
              Container(
                child: GestureDetector(
                    onTap: onDecrease,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: kPrimaryColor,
                      size: 20.0,
                    )),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Text('${currentValue == 0 ?  hint : currentValue }',textAlign: TextAlign.center,),
            ),
          ),
       
        ],
      ),
    );
  }
}
