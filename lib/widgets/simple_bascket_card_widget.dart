import 'package:decooj_buyers/features/cart_fragment/cart_model.dart';
import 'package:decooj_buyers/generics/drop_down_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:decooj_buyers/widgets/drop_down_widget.dart';
import 'package:decooj_buyers/widgets/number_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleBasketCardWidget extends StatefulWidget {
  final Function(CartModel) onModelChange;
  final CartModel model;
  final int index;
  final Function(int) onDeleteClick;

  SimpleBasketCardWidget(
      {Key key, this.onModelChange, this.model, this.index, this.onDeleteClick})
      : super(key: key);

  @override
  _SimpleBasketCardWidgetState createState() => _SimpleBasketCardWidgetState();
}

class _SimpleBasketCardWidgetState extends State<SimpleBasketCardWidget> {
  final List<DropDownModel> delivery = [
    DropDownModel(1, 'پیک'),
    DropDownModel(2, 'وانت'),
    DropDownModel(3, 'پست'),
  ];
  DropDownModel selected;

  @override
  void initState() {
    // TODO: implement initState
    selected = delivery[0];
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Color accentColor = kAccentColor;
    String headerTitle = 'عادی';

    if (widget.model.type == ORDER_TYPE_SPECIAL) {
      accentColor = kAccentTextColor;
      headerTitle = 'سفارشی';
    }
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.44,
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
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Text(
                  'تومان',
                  style: kMessageTextStyle.copyWith(color: kHintTextColor),
                ),
                Expanded(
                  child: Text(
                    widget.model.price,
                    style: kMessageTextStyle.copyWith(color: kHintTextColor),
                  ),
                ),
                Text(
                  'قیمت',
                  style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
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
          //////////////

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropDownWidget(
                width: MediaQuery.of(context).size.width * 0.3,
                hint: '',
                currentVal: selected,
                items: delivery,
                onSelectItem: (selected) {
                  setState(() {
                    this.selected = selected;
                  });
                },

              ),
              Expanded(
                child: Text(
                  'روش ارسال',
                  style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(width: 10,),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          widget.model.type == ORDER_TYPE_SPECIAL
              ? Align(
            alignment: Alignment.center,
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'صدور فاکتور',
                      style: kTitleTextStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(10),
                    color: kAccentTextColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
              )
              : Align(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'پرداخت تکی',
                style: kTitleTextStyle.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(10),
              color: kAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
