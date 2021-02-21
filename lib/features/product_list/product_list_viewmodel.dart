import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:decooj_buyers/widgets/product_slider_widget.dart';
import 'package:flutter/cupertino.dart';

class ProductListViewmodel extends BaseViewModel{
  final BuildContext context;
  final TextEditingController textEditingController;
  int categoryId;
  Widget productListView = LoadingWidget();
  ProductListViewmodel({this.context,this.textEditingController,this.categoryId}) : super(context: context){
    getProducts();
  }

  void getProducts() async{
    productListView = GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height ),
          crossAxisCount: 2),
      itemBuilder: (context, i) {
        return ProductsSliderWidget(
          model: ProductModel(
              image: AssetImage('images/mobl_2.png'),
              name: 'مبل یک نفره جدید',
              price: '۲،۳۴۲،۲۳۱',
              priceBefore: '۲،۵۴۲،۲۱۳'),
        );
      },
    );
    notifyListeners();
  }
  void onSudgestionSelected(String query)
  {
    textEditingController.text = query;
    notifyListeners();
  }

}