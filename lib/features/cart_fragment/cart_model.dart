import 'package:flutter/cupertino.dart';

class CartModel {
  int id;
  int type;
  String title;
  String storeName;
  String imageUrl;
  Color selectedColor;
  String feature;
  int count;
  String specialDesc;
  String price;

  CartModel(
      {this.id,
      this.type,
      this.title,
      this.storeName,
      this.imageUrl,
      this.selectedColor,
      this.feature,
      this.count,
      this.specialDesc,
      this.price});
}
