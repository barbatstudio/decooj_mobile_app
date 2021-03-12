import 'package:decooj_buyers/features/profile_fragment/address/address_list/address_model.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/widgets/address_card_widget.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddressListViewModel extends BaseViewModel{
  final BuildContext context;
  Widget addressList = LoadingWidget();
  AddressListViewModel({this.context}) : super(context: context){
    getAddressList();
  }

  List<AddressModel> addresses = [
    AddressModel(
      id: 1,
      address:'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چ',
      number: '10',
      unit: '20',
      lat: 0,
      long: 0,
      recieverName: 'مهران نجفی',
      recieverPhone: '091211111111',
      state: 'تهران',
      city: 'تهران',
      isDefault: true,
    ),
    AddressModel(
      id: 1,
      address:'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چ',
      number: '10',
      unit: '20',
      lat: 0,
      long: 0,
      recieverName: 'مهران نجفی',
      recieverPhone: '091211111111',
      state: 'تهران',
      city: 'تهران',
      isDefault: false,
    ),
    AddressModel(
      id: 1,
      address:'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چ',
      number: '10',
      unit: '20',
      lat: 0,
      long: 0,
      recieverName: 'مهران نجفی',
      recieverPhone: '091211111111',
      state: 'تهران',
      city: 'تهران',
      isDefault: false,
    ),
    AddressModel(
      id: 1,
      address:'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چ',
      number: '10',
      unit: '20',
      lat: 0,
      long: 0,
      recieverName: 'مهران نجفی',
      recieverPhone: '091211111111',
      state: 'تهران',
      city: 'تهران',
      isDefault: false,
    ),
    AddressModel(
      id: 1,
      address:'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چ',
      number: '10',
      unit: '20',
      lat: 0,
      long: 0,
      recieverName: 'مهران نجفی',
      recieverPhone: '091211111111',
      state: 'تهران',
      city: 'تهران',
      isDefault: false,
    ),
    AddressModel(
      id: 1,
      address:'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چ',
      number: '10',
      unit: '20',
      lat: 0,
      long: 0,
      recieverName: 'مهران نجفی',
      recieverPhone: '091211111111',
      state: 'تهران',
      city: 'تهران',
      isDefault: false,
    ),
  ];

  void getAddressList(){
    addressList = ListView.builder(itemCount: addresses.length, itemBuilder: (context,i){
      return AddressCardWidget(
        model: addresses[i],
        onDefaultClick: (selected){},
        onEditClick: (selected){},
      );
    });

    notifyListeners();
  }




}