import 'dart:ui';

import 'package:decooj_buyers/features/product_detail/product_dertail_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/color_selector_widget.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:decooj_buyers/widgets/product_details_slider_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel model;

  ProductDetailView({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProductDetailViewModel>(
        viewModel: ProductDetailViewModel(context: context,model: model),
        builder: (viewModel) {
          return SafeArea(
            child: MainScaffoldWidget(
              onBackClick: () {
                Navigator.pop(context);
              },
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        ProductDetailSliderWidget(imagesUrl: model.images,productName: model.name,),
                        SizedBox(height: 10,),
                        Container(

                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('انتخاب رنگ',style: kTitleTextStyle.copyWith(color: kPrimaryColor),textAlign: TextAlign.right,),
                              SizedBox(height: 10,),
                              ColorSelectorWidget(colors: viewModel.colors,onSelectColor: (selectedColor){},),

                            ],
                          ),
                        ),
                      ],

                  ),
                ),
              ),
            ),
          );
        });
  }
}
