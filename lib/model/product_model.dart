import 'package:flutter/cupertino.dart';

class ProductModel{
  final ImageProvider image;
  final String price;
  final String priceBefore;
  final String name;
  final int id;

  ProductModel({this.image, this.price, this.priceBefore, this.name, this.id});
}