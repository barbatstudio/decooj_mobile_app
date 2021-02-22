import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
class CountdownTimerWidget extends StatefulWidget {
  final int endTime;
  final Function onEnd;

  CountdownTimerWidget({Key key, this.endTime,this.onEnd}) : super(key: key);
  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  CountdownTimerController countdownTimerController;
  @override
  Widget build(BuildContext context) {

    return CountdownTimer(
      controller: countdownTimerController,
    );
  }

  @override
  void initState() {
    super.initState();
    countdownTimerController =
        CountdownTimerController(endTime: widget.endTime,onEnd: widget.onEnd);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimerController.dispose();
    super.dispose();
  }
}
