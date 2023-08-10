import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_container.dart';
import '../components/constants.dart';
import '../components/gender_card.dart';
import '../components/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.neither;
  Color sliderColor = kInactiveCardColor;
  double sliderValue = 100;
  double height = 100;
  double weight = 50;
  double age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppbarTitle),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: GenderCard(
                      gender: capitalizeGender(Gender.male.toString()),
                      genderIcon: maleIcon,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: GenderCard(
                      gender: capitalizeGender(Gender.female.toString()),
                      genderIcon: femaleIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: sliderColor,
                    onPress: () {
                      sliderColor = kActiveCardColor;
                    },
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        separator,
                        const Text(
                          kSliderTitle,
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toInt().toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              ' cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: kSliderActiveColor,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                              activeTrackColor: Colors.white,
                              overlayColor: kOverlayColor,
                            ),
                            child: Slider(
                              value: height,
                              thumbColor: kSliderActiveColor,
                              inactiveColor: kSliderInactiveColor,
                              min: 0,
                              max: 250,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.roundToDouble();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          kWeightTitle,
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toInt().toString(), style: kNumberTextStyle),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: RoundIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  valueChange: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  valueChange: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          kAgeTitle,
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toInt().toString(),
                          style: kNumberTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RoundIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  valueChange: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                valueChange: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BottomContainer(
                  buttonTitle: 'Calculate',
                  onTap: () {
                    CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultsPage(
                            bmi: calc.calculateBMI(),
                            result: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.iconData, required this.valueChange});

  final IconData iconData;
  final VoidCallback valueChange;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: valueChange,
      shape: const CircleBorder(),
      fillColor: kNumberButtonColor,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
