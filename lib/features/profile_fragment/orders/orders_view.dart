import 'package:decooj_buyers/features/profile_fragment/orders/orders_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../profile_view.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<OrdersViewModel>(
      viewModel: OrdersViewModel(context: context),
      builder: (viewModel) {
        return SafeArea(
          child: MainScaffoldWidget(
            onBackClick: () {
              Navigator.pop(context);
            },
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: kAccentColor,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileBtn(
                            isTransparent: true,
                            icon: Image(
                              image: AssetImage('images/ic_sort.png'),
                            ),
                            title: 'مرتب سازی',
                            onBtnClick: () {},
                          ),
                          Text(
                            'سفارشات من',
                            style:
                                kTitleTextStyle.copyWith(color: Colors.white),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.70,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: viewModel.orderListView),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: kPrimaryColorTrans,
              ),
              child: ListView(

                scrollDirection: Axis.horizontal,
                children: [
                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(-1);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == -1 ? kPrimaryColor : Colors.white,
                      child: Text(
                        'همه',
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == -1
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),

                  SizedBox(width: 3,),

                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(ORDER_STATE_ACTIVE);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == ORDER_STATE_ACTIVE ? kPrimaryColor : Colors.white,
                      child: Text(
                        Helper.getOrderState(ORDER_STATE_ACTIVE),
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == ORDER_STATE_ACTIVE
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 3,),



                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(ORDER_STATE_WAITING_FOR_PAYMENT);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == ORDER_STATE_WAITING_FOR_PAYMENT ? kPrimaryColor : Colors.white,
                      child: Text(
                        Helper.getOrderState(ORDER_STATE_WAITING_FOR_PAYMENT),
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == ORDER_STATE_WAITING_FOR_PAYMENT
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 3,),


                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(ORDER_STATE_WAITING_FOR_BILL);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == ORDER_STATE_WAITING_FOR_BILL ? kPrimaryColor : Colors.white,
                      child: Text(
                        Helper.getOrderState(ORDER_STATE_WAITING_FOR_BILL),
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == ORDER_STATE_WAITING_FOR_BILL
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 3,),


                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(ORDER_STATE_WAITING_FOR_VIEW);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == ORDER_STATE_WAITING_FOR_VIEW ? kPrimaryColor : Colors.white,
                      child: Text(
                        Helper.getOrderState(ORDER_STATE_WAITING_FOR_VIEW),
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == ORDER_STATE_WAITING_FOR_VIEW
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 3,),



                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(ORDER_STATE_FINISHED);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == ORDER_STATE_FINISHED ? kPrimaryColor : Colors.white,
                      child: Text(
                        Helper.getOrderState(ORDER_STATE_FINISHED),
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == ORDER_STATE_FINISHED
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 3,),


                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(ORDER_STATE_CANCELED);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == ORDER_STATE_CANCELED ? kPrimaryColor : Colors.white,
                      child: Text(
                        Helper.getOrderState(ORDER_STATE_CANCELED),
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == ORDER_STATE_CANCELED
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 3,),


                  FlatButton(
                      onPressed: () {
                        viewModel.updateSelectedState(ORDER_STATE_RETURNED);
                      },
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: viewModel.selectedState == ORDER_STATE_RETURNED ? kPrimaryColor : Colors.white,
                      child: Text(
                        Helper.getOrderState(ORDER_STATE_RETURNED),
                        style: kTitleTextStyle.copyWith(
                            color: viewModel.selectedState == ORDER_STATE_RETURNED
                                ? Colors.white
                                : kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 3,),




                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
