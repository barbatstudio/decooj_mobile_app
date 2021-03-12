import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailViewModel extends BaseViewModel{
  final BuildContext context;
  ProductModel model;

  ProductDetailViewModel({this.context,this.model}): super(context: context);
}