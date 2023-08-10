import 'package:bmi_calculator/components/themedata.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: theme1,
    );
  }
}
