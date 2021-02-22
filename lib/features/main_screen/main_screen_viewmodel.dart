import 'package:decooj_buyers/features/cart_fragment/cart_view.dart';
import 'package:decooj_buyers/features/category_fragment/category_fragment_view.dart';
import 'package:decooj_buyers/features/home_fragment/home_fragment_view.dart';
import 'package:decooj_buyers/features/login_flow/get_phone/get_phone_view.dart';
import 'package:decooj_buyers/features/profile_fragment/profile_view.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';

class MainScreenViewModel extends BaseViewModel{
  int selectedFragmentIndex = kFragmentHome;
  Widget selectedFragment = LoadingWidget();
  final TextEditingController textEditingController;
  bool isSetting = false;
  Function onBackClick;
  final BuildContext context;

  MainScreenViewModel({this.context,this.textEditingController}):super(context: context){
    changeFragment(kFragmentHome);
  }



  void changeFragment(int fragmentIndex)
  {
    selectedFragmentIndex  = fragmentIndex;
    isSetting = false;
    onBackClick = null;
    switch(fragmentIndex)
    {
      case kFragmentHome:
        selectedFragment = HomeFragmentView();
        break;

      case kFragmentCategory:
        selectedFragment  =CategoryFragmentView();

        break;

      case kFragmentOrders:
        selectedFragment  =CartView();

        break;

      case kFragmentProfile:
        selectedFragment = ProfileView();
        isSetting = true;
        onBackClick = (){};
        break;
    }

    notifyListeners();
  }

}