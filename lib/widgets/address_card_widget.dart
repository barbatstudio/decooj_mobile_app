import 'package:decooj_buyers/features/profile_fragment/address/address_list/address_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddressCardWidget extends StatelessWidget {
  final AddressModel model;
  final Function(AddressModel selected) onEditClick;
  final Function(AddressModel selected) onDefaultClick;

  AddressCardWidget(
      {Key key, this.model, this.onEditClick, this.onDefaultClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [kBoxShadow],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'نشانی',
            style: kTitleTextStyle.copyWith(color: kPrimaryColor),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            model.address,
            overflow: TextOverflow.fade,
            style: kMessageTextStyle.copyWith(color: kPrimaryColor),
            maxLines: 3,
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'شهر',
            style: kTitleTextStyle.copyWith(color: kPrimaryColor),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${model.state} - ${model.city}',
            overflow: TextOverflow.fade,
            style: kMessageTextStyle.copyWith(color: kPrimaryColor),
            maxLines: 3,
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'گیرنده',
            style: kTitleTextStyle.copyWith(color: kPrimaryColor),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            model.recieverName,
            overflow: TextOverflow.fade,
            style: kMessageTextStyle.copyWith(color: kPrimaryColor),
            maxLines: 3,
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'شماره تماس',
            style: kTitleTextStyle.copyWith(color: kPrimaryColor),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            model.recieverPhone,
            overflow: TextOverflow.fade,
            style: kMessageTextStyle.copyWith(color: kPrimaryColor),
            maxLines: 3,
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                  onPressed: () {
                    onEditClick(model);
                  },
                  color: kAccentTextColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'ویرایش',
                    style: kTitleTextStyle.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
              model.isDefault
                  ? Container(
                      child: Text(
                        'آدرس پیش فرض',
                        style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : FlatButton(
                      onPressed: () {
                        onDefaultClick(model);
                      },
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'انتخاب به عنوان پیش فرض',
                        style: kTitleTextStyle.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))
            ],
          ),
        ],
      ),
    );
  }
}
