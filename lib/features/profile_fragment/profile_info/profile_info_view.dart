import 'package:decooj_buyers/features/profile_fragment/address/address_list/adress_list_view.dart';
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

class ProfileInfoView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProfileInfoViewModel>(
        viewModel: ProfileInfoViewModel(context: context),
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
                        'اطلاعات کاربری',
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
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 3) {
                                    return 'مقدار نام باید بیشتر از ۳ حرف باشد';
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
                              label: 'نام',
                            ),
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (val) {
                                  print(val);
                                },
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 3) {
                                    return 'مقدار نام خانوادگی باید بیشتر از ۳ حرف باشد';
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
                              label: 'نام خانوادگی',
                            ),
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (val) {
                                  print(val);
                                },
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 3) {
                                    return 'مقدار وارد شده صحیح نمی باشد';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 5),
                                    hintTextDirection: TextDirection.rtl,
                                    hintText: '09xxxxxxxxx',
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor))),
                              ),
                              label: 'شماره تلفن همراه',
                            ),
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (val) {
                                  print(val);
                                },
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 3) {
                                    return 'مقدار وارد شده صحیح نمی باشد';
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
                              label: 'کد ملی',
                            ),
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (val) {
                                  print(val);
                                },
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (!Helper.validateEmail(val)) {
                                    return 'مقدار وارد شده صحیح نمی باشد';
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
                              label: 'پست الکترونیک',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ChangePasswordView()),
                                  );
                                },
                                child: Text(
                                  'تغییر گذرواژه',
                                  style: kTitleTextStyle.copyWith(
                                      color: kPrimaryColor),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              alignment: Alignment.centerRight,
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
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, bottom: 25),
                      child: FlatButton(
                        onPressed: () {},
                        color: kAccentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'اضافه کردن اطلاعات حقوقی',
                          style: kTitleTextStyle.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
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
