import 'package:flutter/material.dart';

const bottomContainerColour = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key, required this.buttonTitle, required this.onTap});
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: bottomContainerColour,
          margin: const EdgeInsets.only(bottom: 0, top: 10),
          width: double.infinity,
          height: bottomContainerHeight,
          child: Center(
            child: Text(
              buttonTitle,
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
