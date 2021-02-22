import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel extends BaseViewModel{
  final BuildContext context;
  String imageUrl = '';

  ProfileViewModel({this.context}): super(context: context);
}