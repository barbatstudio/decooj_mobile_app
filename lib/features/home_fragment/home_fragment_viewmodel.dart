import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/cupertino.dart';

class HomeFragmentViewModel extends BaseViewModel {
  final BuildContext context;
  final TextEditingController textEditingController;
  Widget sliderIndicator = Container();
  HomeFragmentViewModel({this.context,this.textEditingController}) : super(context: context){
    sliderIndicator = getSliderIndicator(0);
  }

  List<String> getSudgestions(String query){
    return ['پیشنهاد ۱','پیشنهاد ۶','پیشنهاد ۷','پیشنهاد ۲','پیشنهاد ۳','پیشنهاد ۴','پیشنهاد ۵',];
  }
  void updateSliderIndicator(int index){
    sliderIndicator = getSliderIndicator(index);
    notifyListeners();
  }

  Widget getSliderIndicator (int selected)=>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected == 0 ? kSecondaryColor : kAccentColor
        ),
      ),
      SizedBox(width: 2,),

      Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected == 1 ? kSecondaryColor : kAccentColor
        ),
      ),
      SizedBox(width: 2,),

      Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected == 2 ? kSecondaryColor : kAccentColor
        ),
      ),
      SizedBox(width: 2,),

      Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected == 3 ? kSecondaryColor : kAccentColor
        ),
      ),

    ],
  );
  void onSudgestionSelected(String query)
  {
    textEditingController.text = query;
    notifyListeners();
  }
}