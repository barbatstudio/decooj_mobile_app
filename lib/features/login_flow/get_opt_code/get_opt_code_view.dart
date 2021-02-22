import 'package:decooj_buyers/features/login_flow/get_opt_code/get_opt_code_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/countdown_timer_widget.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GetOptCodeView extends StatelessWidget {
  final int optType;
  final String phoneNumber;

  const GetOptCodeView({Key key, this.optType, this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GetOptCodeViewModel>(
      viewModel: GetOptCodeViewModel(
          context: context, codeType: optType, phoneNumber: phoneNumber),
      builder: (viewModel) {
        return SafeArea(
          child: MainScaffoldWidget(
            onBackClick: () {
              Navigator.pop(context);
            },
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'لطفا کد دریافتی را در کادر زیر وارد نمایید',
                    style: kTitleTextStyle.copyWith(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'تغییر شماره',
                          textAlign: TextAlign.center,
                          style:
                              kTitleTextStyle.copyWith(color: kAccentTextColor),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ارسال شده به شماره ${phoneNumber}',
                        style:
                            kMessageTextStyle.copyWith(color: kAccentTextColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [kBoxShadow]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'کد دریافتی',
                        contentPadding: EdgeInsets.all(10),
                        // hintTextDirection: TextDirection.rtl,
                      ),
                      textAlign: TextAlign.center,
                      onChanged: (data) {
                        viewModel.updateOptCode(data);
                      },
                    ),
                  ),
                  Container(
                    child: viewModel.countDownCounter,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(

                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        optType == OPT_TYPE_LOGIN ? 'ورود' : 'ثبت نام',
                        style: kTitleTextStyle.copyWith(color: kSecondaryTextColor),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: kPrimaryColor,
                    ),
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
