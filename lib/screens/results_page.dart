import 'package:bmi_calculator/components/bottom_container.dart';
import 'package:flutter/material.dart';

import '../components/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmi, required this.result, required, required this.interpretation});

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppbarTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: kActiveCardColor,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: const TextStyle(color: Colors.green, fontSize: 25),
                  ),
                  Text(
                    bmi,
                    style: kNumberTextStyle.copyWith(fontSize: 100),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
              buttonTitle: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
