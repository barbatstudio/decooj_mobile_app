import 'package:decooj_buyers/features/login_flow/get_phone/get_phone_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class GetPhoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GetPhoneViewModel>(
        viewModel: GetPhoneViewModel(context: context),
        builder: (viewModel) {
          return SafeArea(
            child: MainScaffoldWidget(
              onBackClick: () {
                Navigator.pop(context);
              },
              body: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لطفا شماره موبایل خود را وارد کنید',
                      style: kTitleTextStyle.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [kBoxShadow]),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (phoneNumber) {
                          viewModel.updatePhone(phoneNumber.phoneNumber);
                          print(
                              'phoneNumber: ${phoneNumber.phoneNumber}, dialCode: ${phoneNumber.dialCode}, isoCode: ${phoneNumber.isoCode}');
                        },
                        cursorColor: kPrimaryColor,
                        selectorConfig: SelectorConfig(
                            showFlags: true,
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                        hintText: " شماره موبایل",
                        maxLength: 12,
                        initialValue: PhoneNumber(
                            dialCode: '+98', isoCode: 'IR', phoneNumber: ''),
                        searchBoxDecoration: InputDecoration(
                          hintText: 'لطفا کشور مورد نظر خود را وارد کنید',
                          hintTextDirection: TextDirection.rtl,
                          border: InputBorder.none,
                        ),
                        inputDecoration: InputDecoration(
                            hoverColor: kPrimaryColor,
                            hintText: " شماره موبایل",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(10),
                      onPressed: () {},
                      color: kPrimaryColor,
                      child: Text(
                        'ورود/ثبت نام',
                        style: kTitleTextStyle.copyWith(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
