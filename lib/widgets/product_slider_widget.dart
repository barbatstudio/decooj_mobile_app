import 'package:decooj_buyers/model/product_model.dart';
import 'package:decooj_buyers/tools/constants.dart';

import 'package:flutter/material.dart';
class ProductsSliderWidget extends StatelessWidget {
  final ProductModel model;
  final Function(ProductModel) onProductClick;
  const ProductsSliderWidget({Key key, this.model,this.onProductClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onProductClick(model);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [kBoxShadow],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)),
              child: Image(image: model.image),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              model.name,
              textAlign: TextAlign.end,
              style: kTitleTextStyle.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              model.priceBefore,
              textAlign: TextAlign.end,
              style: kTitleTextStyle.copyWith(
                  color: kHintTextColor, decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              model.priceBefore + ' تومان ',
              maxLines: 2,

              style: kTitleTextStyle.copyWith(
                color: kAccentColor,
              ),
              textAlign: TextAlign.end,
            ),

          ],
        ),
      ),
    );
  }
}