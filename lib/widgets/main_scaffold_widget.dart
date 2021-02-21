import 'package:decooj_buyers/features/main_screen/main_screen_view.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MainScaffoldWidget extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget flaotingActionBtn;
  final Color bgColor;
  final Function onBackClick;
  final Widget bottomNavigationBar;

  const MainScaffoldWidget(
      {Key key,
      this.body,
      this.scaffoldKey,
      this.flaotingActionBtn,
      this.bgColor,
        this.bottomNavigationBar,
      this.onBackClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: ui.TextDirection.ltr ,
        child: Scaffold(
          key: scaffoldKey,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: bgColor == null ? Colors.white : bgColor,
          floatingActionButton: flaotingActionBtn,
          appBar: AppBar(
          shadowColor: Colors.transparent,
            automaticallyImplyLeading: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: onBackClick != null
                ? FlatButton(
                    onPressed: onBackClick,
                    child: Icon(
                      Icons.arrow_back,
                      color: kAccentColor,
                    ))
                : Container(),
            actions: [

              Container(
                margin: EdgeInsets.only(right: 15,top: 3),
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('images/decooj_farsi.png'),
                      ),
                    ),
                    SizedBox(height: 1,),
                    Text(
                      'نگاهی نو به صنعت مبلمان',
                      textAlign: TextAlign.end,
                      style: kTitleTextStyle.copyWith(color: kAccentTextColor),
                    ),
                  ],
                ),
              ),
              Image(image: AssetImage('images/decooj_logo.png'))
            ],
          ),


        ),
      ),
    );
  }
}
