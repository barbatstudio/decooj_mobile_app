import 'package:decooj_buyers/features/profile_fragment/change_password/change_password_view.dart';
import 'package:decooj_buyers/features/profile_fragment/profile_info/profile_info_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:decooj_buyers/widgets/form_field_widget.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:decooj_buyers/widgets/map_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'address_list_viewmodel.dart';

class AddressListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AddressListViewModel>(
        viewModel: AddressListViewModel(context: context),
        builder: (viewModel) {
          return SafeArea(
            child: MainScaffoldWidget(
              onBackClick: () {
                Navigator.pop(context);
              },
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: kAccentColor),
                          child: Text(
                            'آدرس های من',
                            style: kTitleTextStyle.copyWith(color: Colors.white),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>MapSample()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('اضافه کردن آدرس جدید',style: kMessageTextStyle.copyWith(color: kPrimaryColor ),textAlign: TextAlign.end,),
                                SizedBox(width: 3,),
                                Icon(Icons.add,color: kPrimaryColor,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                        child: viewModel.addressList)

                  ],
                ),
              ),
            ),
          );
        });
  }
}
