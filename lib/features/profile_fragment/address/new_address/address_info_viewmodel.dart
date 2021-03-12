import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddressInfoViewModel extends BaseViewModel{
  final BuildContext context;
  bool myself = false;
  LatLngBounds bounds;
  AddressInfoViewModel({this.context, this.bounds}) : super(context: context);

  void updateMySelf()
  {
    myself = !myself;
    notifyListeners();
  }


}