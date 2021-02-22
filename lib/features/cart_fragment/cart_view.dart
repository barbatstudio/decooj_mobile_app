import 'package:decooj_buyers/features/cart_fragment/cart_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CartViewModel>(
        viewModel: CartViewModel(context: context),
        builder: (viewModel) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [kBoxShadow]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: kGreenColor,
                    ),
                    child: Text(
                      "سبد خرید",
                      style: kTitleTextStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('images/main_slider_bg.png'),
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
          );
        });
  }
}
