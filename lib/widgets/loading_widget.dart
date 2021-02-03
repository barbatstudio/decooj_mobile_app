import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class LoadingWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainBgColor,
      child: Center(
        child: Loading(
            indicator: BallSpinFadeLoaderIndicator(),
            size: 100.0,
            color: kPrimaryColor),
      ),
    );
  }
}
