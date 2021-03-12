import 'package:flutter/cupertino.dart';

class ProductModel{
  final ImageProvider image;
  final String price;
  final String priceBefore;
  final String name;
  final int id;
  final List<String> images;

  ProductModel({this.image, this.price, this.priceBefore, this.name, this.id,this.images});
}