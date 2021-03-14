import 'package:decooj_buyers/features/cart_fragment/cart_model.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/widgets/bascket_card_widget.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:decooj_buyers/widgets/simple_bascket_card_widget.dart';
import 'package:flutter/cupertino.dart';

class FinalConfirationViewModel extends BaseViewModel{
  final BuildContext context;
  Widget cartListView = LoadingWidget();
  List<CartModel> carts;
  FinalConfirationViewModel({this.context,this.carts}): super(context: context)
  {
    generateListView();
  }

  void generateListView(){
    cartListView = ListView.builder(
      itemCount: carts.length,
      itemBuilder: (context, i) {
        return SimpleBasketCardWidget(
          onModelChange: (model) {},
          model: carts[i],
          index: i,
        );
      },
    );
    notifyListeners();
  }
}