import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TwoTabTextWidget extends StatefulWidget {
  final String title_1;
  final String title_2;
  final String data_1;
  final String data_2;
  final Color tabActivecolor;
  final Color tabDeActivecolor;

  TwoTabTextWidget(
      {Key key,
      this.title_1,
      this.title_2,
      this.data_1,
      this.data_2,
      this.tabActivecolor,
      this.tabDeActivecolor})
      : super(key: key);

  @override
  _TwoTabTextWidgetState createState() => _TwoTabTextWidgetState();
}

class _TwoTabTextWidgetState extends State<TwoTabTextWidget> {
  int selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10))),
                  color: selectedTab == 1
                      ? widget.tabActivecolor
                      : widget.tabDeActivecolor,
                  onPressed: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: Text(
                    widget.title_1,
                    style: kTitleTextStyle.copyWith(
                        color: selectedTab == 1 ? Colors.white : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10))),
                  color: selectedTab == 2
                      ? widget.tabActivecolor
                      : widget.tabDeActivecolor,
                  onPressed: () {
                    setState(() {
                      selectedTab = 2;
                    });
                  },
                  child: Text(
                    widget.title_2,
                    style: kTitleTextStyle.copyWith(
                        color: selectedTab == 2 ? Colors.white : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: Text(
              selectedTab == 1 ? widget.data_1 : widget.data_2,
              style: kMessageTextStyle.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
