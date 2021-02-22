import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/countdown_timer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetOptCodeViewModel extends BaseViewModel {
  final BuildContext context;

  Widget countDownCounter = Container();
  final int codeType;
  String optCode;
  String phoneNumber;
  String timer;

  GetOptCodeViewModel({this.context, this.codeType, this.phoneNumber})
      : super(context: context){
    sendPhone();
  }

  void onCounterEnd() {
    countDownCounter = FlatButton(
        onPressed: () {
          sendPhone();
        },
        child: Text('ارسال دوباره کد تایید'));
    notifyListeners();
  }

  void sendPhone() async {
    countDownCounter = CountdownTimerWidget(
      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30,
      onEnd: onCounterEnd,
    );
    notifyListeners();
  }

  void updateOptCode(String val)
  {
    optCode  = val;
  }
}
