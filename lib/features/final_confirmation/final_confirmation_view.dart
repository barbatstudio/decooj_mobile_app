import 'package:decooj_buyers/features/cart_fragment/cart_model.dart';
import 'package:decooj_buyers/features/final_confirmation/final_confirmation_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';

class FinalConfirmationView extends StatelessWidget {
  final List<CartModel> cards;

  const FinalConfirmationView({Key key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<FinalConfirationViewModel>(
      viewModel: FinalConfirationViewModel(context: context, carts: cards),
      builder: (viewModel) {
        return SafeArea(
          child: MainScaffoldWidget(
            onBackClick: () {
              Navigator.pop(context);
            },
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: viewModel.cartListView),
                  ],
                ),
              )
            ),
            bottomNavigationBar: Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 10),
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
                          style:
                              kTitleTextStyle.copyWith(color: Colors.black),
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
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: kPrimaryColor,
                          child: Text(
                            'تایید نهایی و پرداخت کل',
                            style: kTitleTextStyle.copyWith(
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: kHintTextColor,
                          child: Text(
                            'برگشت',
                            style: kTitleTextStyle.copyWith(
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
