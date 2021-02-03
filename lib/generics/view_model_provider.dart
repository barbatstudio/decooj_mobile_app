import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final BaseViewModel viewModel;
  final Widget Function(T viewModel) builder;

  ViewModelProvider({@required this.viewModel, @required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context2) => viewModel,
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget child) =>
            builder(value),
      ),
    );
  }
}
