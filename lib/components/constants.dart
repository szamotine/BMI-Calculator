import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kIconSize = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kSliderActiveColor = Color(0XFFEB1555);
const kSliderInactiveColor = Color(0xFF8D8E98);
const kNumberButtonColor = Color(0xFF4C4F5E);
const kDarkPurple = Color(0xFF0A0E21);
const kAppbarTitle = 'BMI CALCULATOR';
const kSliderTitle = 'HEIGHT';
const kWeightTitle = 'WEIGHT';
const kAgeTitle = 'AGE';

const kSeparatorSizeBoxHeight = 15.0;
const kLabelTextStyle = TextStyle(
  fontSize: 18, // 18,
  color: textColor,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

const kOverlayColor = Color(0x1fEB1555);

const SizedBox separator = SizedBox(
  height: kSeparatorSizeBoxHeight,
);
const textColor = Color(0xFF8D8E98);

const maleIcon = Icon(
  FontAwesomeIcons.mars,
  size: kIconSize,
);
const femaleIcon = Icon(
  FontAwesomeIcons.venus,
  size: kIconSize,
);

enum Gender {
  male,
  female,
  neither,
}

String capitalizeGender(String input) {
  int start = 7;
  return "${input[start].toUpperCase()}${input.substring(start + 1)}";
}
