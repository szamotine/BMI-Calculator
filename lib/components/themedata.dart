import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme1 = ThemeData(
    scaffoldBackgroundColor: kDarkPurple,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: kDarkPurple,
    ));

ThemeData theme2 = ThemeData(
  scaffoldBackgroundColor: kDarkPurple,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: kDarkPurple,
  ),
);
