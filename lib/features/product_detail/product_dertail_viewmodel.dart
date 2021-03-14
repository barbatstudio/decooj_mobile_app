import 'package:carousel_slider/carousel_slider.dart';
import 'package:decooj_buyers/features/product_detail/product_detail_view.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/generics/drop_down_model.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:decooj_buyers/widgets/product_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel extends BaseViewModel {
  final BuildContext context;
  int commentCount = 45;
  ProductModel model;
  Widget productListView = LoadingWidget();
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.blueGrey,
    Colors.blueAccent,
    Colors.redAccent
  ];
  List<DropDownModel> features = [
    DropDownModel(0, 'چرمی'),
    DropDownModel(1, 'پارچه ای'),
    DropDownModel(2, 'چوبی'),
  ];

  DropDownModel selected ;

  ProductDetailViewModel({this.context, this.model}) : super(context: context){
    selected = features[0];
    getRelatedProducts();
  }

  void updateSelectedFeature(DropDownModel selected){
    this.selected = selected;
    notifyListeners();
  }

  void getRelatedProducts() async{
    productListView = CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int itemIndex) {
        return ProductsSliderWidget(
          model: ProductModel(
              image: AssetImage('images/mobl_2.png'),
              name: 'مبل یک نفره جدید',
              price: '۲،۳۴۲،۲۳۱',
              priceBefore: '۲،۵۴۲،۲۱۳'),
        );
      },
      options: CarouselOptions(
          height: 350,
          viewportFraction: 0.6,
          autoPlay: false,
          onPageChanged: (index, reason) {}),
    );
    notifyListeners();
  }
}
