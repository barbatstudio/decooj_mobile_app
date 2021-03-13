import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel extends BaseViewModel{
  final BuildContext context;
  ProductModel model;
  List<Color> colors = [Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.blueGrey,Colors.blueAccent,Colors.redAccent];

  ProductDetailViewModel({this.context,this.model}): super(context: context);
}