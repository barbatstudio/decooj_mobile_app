import 'package:carousel_slider/carousel_slider.dart';
import 'package:decooj_buyers/features/product_list/product_list_view.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:decooj_buyers/widgets/product_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryViewModel extends BaseViewModel {
  final BuildContext context;
  int categoryId;
  Widget subCategoriesListView = LoadingWidget();
  Widget topSaleProductsListView = LoadingWidget();
  Widget topRatedProductsListView = LoadingWidget();
  final TextEditingController textEditingController;

  SubCategoryViewModel(
      {this.context, this.categoryId, this.textEditingController})
      : super(context: context) {
    getSubcategories();
  }

  void onSudgestionSelected(String query) {
    textEditingController.text = query;
    notifyListeners();
  }

  List<String> subcategories = [
    'پارچه',
    'رنگ',
    'یراق آلات',
    'پارچه',
    'یراق آلات',
    'یراق آلات',
    'یراق آلات'
  ];

  void getSubcategories() async {
    subCategoriesListView = ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subcategories.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductListView(
                    categoryId: categoryId,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.03,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [kBoxShadow],
                  color: Colors.white),
              child: Center(
                child: Text(
                  subcategories[i],
                  style: kTitleTextStyle.copyWith(color: kAccentColor),
                ),
              ),
            ),
          );
        });

    topSaleProductsListView = CarouselSlider.builder(
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

    topRatedProductsListView = CarouselSlider.builder(
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
