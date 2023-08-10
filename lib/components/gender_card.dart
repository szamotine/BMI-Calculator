import 'package:flutter/material.dart';

import 'constants.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final Icon genderIcon;

  const GenderCard({super.key, required this.gender, required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        genderIcon,
        separator,
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
