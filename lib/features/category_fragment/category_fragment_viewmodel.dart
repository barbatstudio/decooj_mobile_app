import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryFragmentViewModel extends BaseViewModel {
  final BuildContext context;
  final TextEditingController textEditingController;
  CategoryFragmentViewModel({this.context,this.textEditingController}) : super(context: context);

  List<String> getSudgestions(String query){
    return ['پیشنهاد ۱','پیشنهاد ۶','پیشنهاد ۷','پیشنهاد ۲','پیشنهاد ۳','پیشنهاد ۴','پیشنهاد ۵',];
  }

  void onSudgestionSelected(String query)
  {
    textEditingController.text = query;
    notifyListeners();
  }
}