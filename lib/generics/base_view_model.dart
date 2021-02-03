import 'package:decooj_buyers/tools/helper.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  final BuildContext context;

  BaseViewModel({@required this.context}) {}

  void showProgress({BuildContext context})
  {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')));
  }
  void handleRestErrors(int httpResCode, String message,{BuildContext context}) async {
    switch (httpResCode) {
      case 401:
        await Helper.saveToken("");
        Navigator.pushReplacementNamed(context==null ? this.context : context, '/login_register');
        break;
      case 200:
        break;
      default:
        Scaffold.of(context==null ? this.context : context).showSnackBar(SnackBar(content: Text(message)));
        break;
    }
  }
}
