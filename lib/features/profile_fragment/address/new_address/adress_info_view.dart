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
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'address_info_viewmodel.dart';

class AddressInfoView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LatLngBounds bounds;

  AddressInfoView({Key key, this.bounds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AddressInfoViewModel>(
        viewModel: AddressInfoViewModel(context: context,bounds: bounds),
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
                        'آدرس های جدید',
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
                                    return 'مقدار باید بیشتر از ۳ حرف باشد';
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
                              label: 'استان',
                            ),
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 10,
                                minLines: 5,
                                onChanged: (val) {
                                  print(val);
                                },
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 10) {
                                    return 'مقدار باید بیشتر از ۱۰ حرف باشد';
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
                              label: 'آدرس',
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
                                  if (val.isEmpty) {
                                    return 'مقدار نمیتواند خالی باشد';
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
                              label: 'پلاک',
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
                                  if (val.isEmpty) {
                                    return 'مقدار نمیتواند خالی باشد';
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
                              label: 'واحد',
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
                                  if (val.isEmpty || val.length < 16) {
                                    return 'مقدار باید بیشتر از ۱۶ حرف باشد';
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
                              label: 'کد پستی',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: viewModel.myself,
                                  onChanged: (bool value) {
                                    viewModel.updateMySelf();
                                  },
                                ),
                                SizedBox(height: 5,),

                                SizedBox(width: 10,),
                                Text('گیرنده سفارش خودم هستم',style: kMessageTextStyle.copyWith(color: kPrimaryColor),)
                              ],
                            ),
                            viewModel.myself ? Container():
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
                                    return 'مقدار باید بیشتر از ۳ حرف باشد';
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
                              label: 'نام گیرنده',
                            ),

                            viewModel.myself ? Container():
                            FormFieldWidget(
                              textField: TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (val) {
                                  print(val);
                                },
                                textDirection: TextDirection.rtl,
                                validator: (val) {
                                  if (val.isEmpty || val.length < 9) {
                                    return 'مقدار باید بیشتر از ۹ حرف باشد';
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
                              label: 'تلفن گیرنده',
                            ),
                            SizedBox(height: 10,),
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
