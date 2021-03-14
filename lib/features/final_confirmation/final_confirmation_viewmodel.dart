import 'package:decooj_buyers/features/cart_fragment/cart_model.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class FinalConfirationViewModel extends BaseViewModel{
  final BuildContext context;

  List<CartModel> carts;
  FinalConfirationViewModel({this.context,this.carts}): super(context: context);
}