import 'package:decooj_buyers/features/profile_fragment/orders/orders_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderCardWidget extends StatelessWidget {
  final OrdersModel model;
  final Function(OrdersModel model) onViewClick;

  OrderCardWidget({Key key, this.model, this.onViewClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: model.orderType== ORDER_TYPE_NORMAL
                ? kAccentColor
                : kAccentTextColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.orderDate,
                style: kTitleTextStyle.copyWith(color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Text(
                model.uniqueCode,
                style: kTitleTextStyle.copyWith(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16,top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: model.imageUrl == null || model.imageUrl == ''
                          ? AssetImage('images/mobl_2.png')
                          : NetworkImage(model.imageUrl)),
                  Column(
                    children: [
                      Text(
                        'وضعیت سفارش',
                        style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 3,),
                      Text(
                        Helper.getOrderState(model.state),
                        style: kTitleTextStyle.copyWith(color: Helper.getOrderStatesColor(model.state)),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {
                    onViewClick(model);
                  },
                  color: model.orderType == ORDER_TYPE_NORMAL
                      ? kAccentColor
                      : kAccentTextColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'مشاهده',
                    textAlign: TextAlign.center,
                    style: kTitleTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
