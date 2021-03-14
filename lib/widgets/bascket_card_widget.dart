import 'package:decooj_buyers/features/cart_fragment/cart_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:decooj_buyers/widgets/number_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasketCardWidget extends StatefulWidget {
  final Function(CartModel) onModelChange;
  final CartModel model;
  final int index;
  final Function(int) onDeleteClick;

  BasketCardWidget(
      {Key key, this.onModelChange, this.model, this.index, this.onDeleteClick})
      : super(key: key);

  @override
  _BasketCardWidgetState createState() => _BasketCardWidgetState();
}

class _BasketCardWidgetState extends State<BasketCardWidget> {
  @override
  Widget build(BuildContext context) {
    Color accentColor = kAccentColor;
    String headerTitle = 'عادی';

    if (widget.model.type == ORDER_TYPE_SPECIAL) {
      accentColor = kAccentTextColor;
      headerTitle = 'سفارشی';
    }
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.58,
      decoration: BoxDecoration(
        boxShadow: [kBoxShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  headerTitle,
                  style: kTitleTextStyle.copyWith(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '# ${widget.index + 1}',
                  style: kTitleTextStyle.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [kBoxShadow],
                    borderRadius: BorderRadius.circular(10)),
                child: Image(
                  width: 60,
                  height: 60,
                  image: widget.model.imageUrl == '' ||
                          widget.model.imageUrl == null
                      ? AssetImage('images/mobl_2.png')
                      : NetworkImage(widget.model.imageUrl),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.model.title,
                      style: kTitleTextStyle.copyWith(color: Colors.black),
                      textAlign: TextAlign.right,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.model.storeName,
                      style: kTitleTextStyle.copyWith(color: kAccentTextColor),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 20),
            child: Text(
              'توضیحات',
              style: kTitleTextStyle.copyWith(color: kPrimaryColor),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: widget.model.selectedColor),
                    ),
                    Text(
                      'رنگ',
                      style: kMessageTextStyle.copyWith(color: kHintTextColor),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${widget.model.feature}',
                        style:
                            kMessageTextStyle.copyWith(color: kHintTextColor),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'جنس پشتی',
                      style: kMessageTextStyle.copyWith(color: kHintTextColor),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              widget.model.type == ORDER_TYPE_SPECIAL
                  ? Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: kAccentTextColor,
                          child: Text(
                            'مشاهده',
                            style:
                                kTitleTextStyle.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: kStopColor,
                ),
                onPressed: () {
                  widget.onDeleteClick(widget.index);
                },
              ),
              Expanded(
                child: Text(
                  'حذف',
                  style: kMessageTextStyle.copyWith(color: kStopColor),
                  textAlign: TextAlign.left,
                ),
              ),
              NumberPickerWidget(
                currentValue: widget.model.count,
                onIncrease: () {
                  setState(
                    () {
                      widget.model.count++;
                    },
                  );
                },
                onDecrease: (){
                  if(widget.model.count >= 2){
                    setState(() {
                      widget.model.count--;
                    });
                  }
                },
              ),
              SizedBox(width: 20,),
              Text('تعداد',style: kTitleTextStyle.copyWith(color: kPrimaryColor),),
              SizedBox(width: 10,),
            ],
          ),
          SizedBox(height: 8,),
          Divider(thickness: 2,),
          SizedBox(height: 8,),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              children: [
                Text('تومان',style: kMessageTextStyle.copyWith(color: kHintTextColor),),
                Expanded(child: Text(widget.model.price,style: kMessageTextStyle.copyWith(color: kHintTextColor),),),
                Text('قیمت',style: kTitleTextStyle.copyWith(color: kPrimaryColor),),
                SizedBox(width: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
