import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:flutter/material.dart';

class GetPhoneViewModel extends BaseViewModel{
  final BuildContext context;
  String phoneNumber;

  GetPhoneViewModel({this.context}) : super(context: context);

  void login_signup(){}

  void updatePhone(String newVal){
    phoneNumber = newVal;
    notifyListeners();
  }
}