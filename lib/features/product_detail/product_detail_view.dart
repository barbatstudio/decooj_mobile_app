import 'package:decooj_buyers/features/product_detail/product_dertail_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/model/product_model.dart';
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
                      ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
