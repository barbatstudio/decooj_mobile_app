import 'package:decooj_buyers/features/login_flow/get_phone/get_phone_view.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartViewModel extends BaseViewModel{
  final BuildContext context;
  Widget cartListView = LoadingWidget();
  bool isLogedIn  = false;
  CartViewModel({this.context}): super(context: context){
    checkLogin();
    getCart();
  }

  void getCart() async{
    if(true)
      {
          cartListView = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined,color: Colors.black,),
              SizedBox(height: 10,),
              Text(isLogedIn ? "سبد خرید شما خالی است":"لطفا وارد پروفایل کاربری خود شوید ",style: kTitleTextStyle.copyWith(color: Colors.black),),
              SizedBox(height: 10,),
              isLogedIn
                  ? Container()
                  : FlatButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (_)=> GetPhoneView()));
                },
                child: Text(
                  'ورود/ثبت نام',
                  style: kTitleTextStyle.copyWith(
                      color: Colors.white),
                ),
                padding: EdgeInsets.all(10),
                color: kGreenColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ],
          );
      }else{

    }
    notifyListeners();
  }

  void checkLogin(){
    isLogedIn = false;
    notifyListeners();
  }
}