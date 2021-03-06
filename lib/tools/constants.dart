import 'dart:ui';

import 'package:flutter/material.dart';

const String kAppName = '';

const Color kDarkPrimaryColor = Color(0xFFF57C00);
const Color kLightPrimaryColor = Color(0xFFFFE0B2);
const Color kPrimaryColor = Color(0xFF324467);
const Color kPrimaryColorTrans = Color(0xa0324467);
const Color kSecondaryColor = Color(0xFFFFDF80);
const Color kAccentColor = Color(0xFF53B9B6);
const Color kPrimaryTextColor = Color(0xFF6C61DE);
const Color kSecondaryTextColor = Color(0xFFFFFFFF);
const Color kAccentTextColor = Color(0xFFB7A493);
const Color kHintTextColor = Color(0xFFA4A4A4);
const Color kDividerColor = Color(0xFFBDBDBD);
const Color kTabActive = Color(0xFF7D8186);
const Color kTabDeActive = Color(0xFFC6CAD1);
const Color kChipDeactiveColor = Color(0xFFDFDFDF);

const Color kGreenColor = Color(0xFF218683);
const Color kGreenColorTransparent = Color(0x10008265);
const Color kMainBgColor = Color(0xFFF3F3F3);
const Color kStopColor = Color(0xFFe4464b);
const Color kBlueColor = Color(0xFF0080FF);
const Color kOrangeColor = Color(0xFFFF8000);

const int kFragmentHome = 3;
const int kFragmentCategory = 2;
const int kFragmentOrders = 1;
const int kFragmentProfile = 0;

const String kLoremIpsum = 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد ';

const TextStyle kTitleTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);

const TextStyle kMessageTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontWeight: FontWeight.normal,
  fontSize: 13.0,
);

const String kSharedPrefToken = 'token';
const String kSharedPrefBaseUrl = 'base_url';
const double bottomNavHeight = 80.0;

const String kConnectionErrorMsg = 'Connection Problem';
const String kInvalidDataErrorMsg = 'Invalid Data';


const BoxShadow kBoxShadow = BoxShadow(
  color: Color(0xFFBDBDBD),
  blurRadius: 5.0, // has the effect of softening the shadow
  spreadRadius: 0.5, // has the effect of extending the shadow
  offset: Offset(
    1.0, // horizontal, move right 10
    3.0, // vertical, move down 10
  ),
);

const BoxShadow kBottomNavShadow = BoxShadow(
  color: Color(0xFFBDBDBD),
  blurRadius: 1.0, // has the effect of softening the shadow
  spreadRadius: 1.0, // has the effect of extending the shadow
  offset: Offset(
    1.0, // horizontal, move right 10
    34.0, // vertical, move down 10
  ),
);

const BoxShadow kBoxShadowBlack = BoxShadow(
  color: Colors.black45,
  blurRadius: 5.0, // has the effect of softening the shadow
  spreadRadius: 0, // has the effect of extending the shadow
  offset: Offset.infinite
);

const BoxDecoration kFormFieldDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(5.0),
    ),
    boxShadow: [kBoxShadow]);

const int FIELD_TYPE_TEX = 1;
const int FIELD_TYPE_NUMBER = 2;
const int FIELD_TYPE_SINGLE_CHECK_BOX = 3;
const int FIELD_TYPE_SINGLE_DROP_DOWN = 5;
const int FIELD_TYPE_LIST_CHECK_BOX = 6;

const int STEP_GET_OPTIONS_PARAMETERS = 1;
const int STEP_GET_PARAMETERS_WEIGHT = 2;

const int OPT_TYPE_LOGIN = 1;
const int OPT_TYPE_SIGN_UP = 2;

const int ORDER_TYPE_NORMAL = 1;
const int ORDER_TYPE_SPECIAL = 2;

const int ORDER_STATE_ACTIVE = 1;
const int ORDER_STATE_WAITING_FOR_PAYMENT = 2;
const int ORDER_STATE_FINISHED = 3;
const int ORDER_STATE_RETURNED = 4;
const int ORDER_STATE_CANCELED = 5;
const int ORDER_STATE_WAITING_FOR_BILL = 6;
const int ORDER_STATE_WAITING_FOR_VIEW = 7;
