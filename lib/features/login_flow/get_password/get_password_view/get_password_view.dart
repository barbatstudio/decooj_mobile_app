import 'package:decooj_buyers/features/login_flow/get_password/get_password_view/get_password_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetPasswordView extends StatelessWidget {
  final String phoneNumber;

  const GetPasswordView({Key key, this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GetPasswordViewModel>(
      viewModel: GetPasswordViewModel(context: context),
      builder: (viewModel) {
        return SafeArea(
          child: MainScaffoldWidget(
            onBackClick: () {
              Navigator.pop(context);
            },
            body: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لطفا گذرواژه خود را وارد کنید',
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
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'رمز عبور',

                          contentPadding: EdgeInsets.all(10),
                          hintTextDirection: TextDirection.rtl),
                      obscureText: true,
                      textAlign: TextAlign.end,
                      onChanged: (data) {
                        print("password: $data");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'ورود با کد تایید',
                            style:
                                kTitleTextStyle.copyWith(color: kPrimaryColor),
                            textAlign: TextAlign.end,
                          ))),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'فراموشی رمز عبور',
                        style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                        textAlign: TextAlign.end,
                      ),
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
                      'ورود',
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
      },
    );
  }
}
