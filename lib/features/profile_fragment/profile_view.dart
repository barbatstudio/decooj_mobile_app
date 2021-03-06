import 'package:decooj_buyers/features/profile_fragment/address/address_list/adress_list_view.dart';
import 'package:decooj_buyers/features/profile_fragment/orders/orders_view.dart';
import 'package:decooj_buyers/features/profile_fragment/profile_info/profile_info_view.dart';
import 'package:decooj_buyers/features/profile_fragment/profile_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProfileViewModel>(
        viewModel: ProfileViewModel(context: context),
        builder: (viewModel) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                    backgroundImage: viewModel.imageUrl.isEmpty
                        ? AssetImage('images/profile_pic.png')
                        : NetworkImage(viewModel.imageUrl)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'مهران نجفی',
                  style: kTitleTextStyle.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '+989362380264',
                  style: kTitleTextStyle.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                ProfileBtn(
                  icon: Image(image: AssetImage('images/ic_profile.png'),),
                  title: 'اطلاعات کاربری',
                  onBtnClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileInfoView()));
                  },
                ),
                ProfileBtn(
                  icon: Image(image: AssetImage('images/ic_furniture.png'),),
                  title: 'سفارشات من',
                  onBtnClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OrdersView()));
                  },
                ),
                ProfileBtn(
                  icon: Image(image: AssetImage('images/ic_map_pin.png'),),
                  title: 'آدرس های من ',
                  onBtnClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>AddressListView()));
                  },
                ),
              ],
            ),
          );
        });
  }
}

class ProfileBtn extends StatelessWidget {
  final String title;
  final Image icon;
  final Function onBtnClick;
  final bool isTransparent;

  ProfileBtn({Key key, this.title, this.icon, this.onBtnClick,this.isTransparent = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBtnClick,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isTransparent ? Colors.transparent : Colors.white,
          boxShadow:isTransparent ? null: [kBoxShadow]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 10,),
            Text(title,style: kTitleTextStyle.copyWith(color: Colors.black),textAlign: TextAlign.center,),
            SizedBox(width: 10,),
            icon,


          ],
        ) ,
      ),
    );
  }
}
