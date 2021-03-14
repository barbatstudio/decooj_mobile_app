import 'package:decooj_buyers/features/cart_fragment/cart_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CartViewModel>(
        viewModel: CartViewModel(context: context),
        builder: (viewModel) {
          return SingleChildScrollView(
            child: !viewModel.isLogedIn
                ? Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [kBoxShadow]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewModel.updateLogin();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: kGreenColor,
                              ),
                              child: Text(
                                "سبد خرید",
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.white),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.white,
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/main_slider_bg.png'),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(child: viewModel.cartListView),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            viewModel.updateLogin();
                          },
                          child: Container(
                            color: kAccentColor,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'سبد خرید',
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: viewModel.cartListView,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'تومان',
                                      style: kMessageTextStyle.copyWith(
                                          color: kAccentColor),
                                      textAlign: TextAlign.left,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '۲۳۴،۳۲۳،۳۲۳۴',
                                        style: kTitleTextStyle.copyWith(
                                            color: kAccentColor),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Text(
                                      'جمع سبد خرید',
                                      style: kTitleTextStyle.copyWith(
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: FlatButton(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: kPrimaryColor,
                                      child: Text(
                                        'نهایی کردن خرید',
                                        style: kTitleTextStyle.copyWith(
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: FlatButton(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: kAccentColor,
                                      child: Text(
                                        'ادامه خرید',
                                        style: kTitleTextStyle.copyWith(
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 110,
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
