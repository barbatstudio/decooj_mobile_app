import 'dart:async';
import 'dart:ui';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class Helper {
  static StreamController<int> ACTIVE_TASK_STREAM_CONTROLER =
      StreamController.broadcast();

  static StreamController<int> UNSEEN_NOTIFICATION_STREAM_CONTROLER =
      StreamController.broadcast();

  static StreamController<int> RELOAD_STREAM_CONTROLLER =
      StreamController.broadcast();

//  static StreamController<String>

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  static Color getPriorityColor(int priority){
    switch(priority)
    {
      case 1:
        return Colors.red;
      case 2:
        return Colors.green;
      case 3:
        return Colors.grey;

    }
  }


  static Future<void> showMyDialog(BuildContext context, String msg, Function onOkClick,Function onCancelClick,String title) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,style: kTitleTextStyle,),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg,style: kTitleTextStyle,),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("تایید",style: kTitleTextStyle.copyWith(color: kSecondaryColor),),
              onPressed: onOkClick,
            ),

            FlatButton(
              child: Text("لغو",style: kTitleTextStyle.copyWith(color: kStopColor),),
              onPressed: onCancelClick,
            ),
          ],
        );
      },
    );
  }


  static Future<bool> getPermission() async{
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  static String getOrderState (int state)
  {
    switch(state){
      case ORDER_STATE_ACTIVE:
        return 'در حال انجام';
      case ORDER_STATE_CANCELED:
        return 'لغو شده';

      case ORDER_STATE_RETURNED:
        return 'مرجوعی';

      case ORDER_STATE_WAITING_FOR_PAYMENT:
        return 'در انتظار پرداخت';
      case ORDER_STATE_FINISHED:
        return 'تحویل شده';

      case ORDER_STATE_WAITING_FOR_BILL:
        return 'در انتظار صدور فاکتور';

      case ORDER_STATE_WAITING_FOR_VIEW:
        return 'در انتظار بازدید';
    }
  }

  static Color getOrderStatesColor (int state)
  {
    switch(state){
      case ORDER_STATE_ACTIVE:
        return kAccentColor;
      case ORDER_STATE_CANCELED:
        return kStopColor;

      case ORDER_STATE_RETURNED:
        return kAccentTextColor;

      case ORDER_STATE_WAITING_FOR_PAYMENT:
        return kBlueColor;
      case ORDER_STATE_FINISHED:
        return kGreenColor;

      case ORDER_STATE_WAITING_FOR_BILL:
        return kHintTextColor;

      case ORDER_STATE_WAITING_FOR_VIEW:
        return kOrangeColor;
    }
  }

  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  static String readTimestamp(int timestamp) {
    print('TIME: $timestamp');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var time = '';
    time = '${date.year}-${date.month}-${date.day}';

    return time;
  }

  static Color contrastColor(Color iColor) {
    // Calculate the perceptive luminance (aka luma) - human eye favors green color...
    double luma = ((0.299 * iColor.red) +
            (0.587 * iColor.green) +
            (0.114 * iColor.blue)) /
        255;

    // Return black for bright colors, white for dark colors
    return luma > 0.5 ? Colors.black : Colors.white;
  }


  static void showProgressSnack(BuildContext context)
  {
    Flushbar(
      title:  "در حال پردازش",
      message:  "لطفا منتظر بمانید",
      duration:  Duration(seconds: 3),
    )..show(context);
  }

  static void showMessageSnack(BuildContext context,String title,String message)
  {
    Flushbar(
      title:  title,
      message:  message,
      duration:  Duration(seconds: 3),
    )..show(context);
  }


  static List<String> getSudgestions(String query) {
    return [
      'پیشنهاد ۱',
      'پیشنهاد ۶',
      'پیشنهاد ۷',
      'پیشنهاد ۲',
      'پیشنهاد ۳',
      'پیشنهاد ۴',
      'پیشنهاد ۵',
    ];
  }


  static void saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(kSharedPrefToken, token);
  }

  static Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(kSharedPrefToken);
  }


}
