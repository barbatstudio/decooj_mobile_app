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

import 'change_password_viewmodel.dart';

class ChangePasswordView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ChangePasswordViewModel>(
        viewModel: ChangePasswordViewModel(context: context),
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
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          color: kAccentColor),
                      child: Text(
                        'تغییر گذرواژه',
                        style: kTitleTextStyle.copyWith(color: Colors.white),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                onChanged: (val) {
                                  print(val);
                                },
                                obscureText: true,
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 8) {
                                    return 'مقدار ۳ حرف باشد';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 5),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor))),
                              ),
                              label: 'گذرواژه فعلی',
                            ),
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (val) {
                                  print(val);
                                },
                                obscureText: true,
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 8) {
                                    return 'مقدار ۸ حرف باشد';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 5),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor))),
                              ),
                              label: 'گذرواژه جدید',
                            ),
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (val) {
                                  print(val);
                                },
                                obscureText: true,
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 8) {
                                    return 'مقدار ۸ حرف باشد';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 5),
                                    hintTextDirection: TextDirection.rtl,

                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor))),
                              ),
                              label: 'تکرار گذرواژه جدید',
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            FlatButton(
                              onPressed: () {},
                              color: kPrimaryColor,
                              padding: EdgeInsets.all(10),
                              minWidth: 150,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'ذخیره',
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
