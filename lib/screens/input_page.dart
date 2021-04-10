import 'file:///C:/Users/FM/Desktop/flutter/bmcalc/lib/screens/result_page.dart';
import 'file:///C:/Users/FM/Desktop/flutter/bmcalc/lib/components/reusable_card.dart';
import 'package:bmcalc/components/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';
import '../components/icon_content.dart';

enum Gender { male, female }

int inputHeight = 180;
int inputWeight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: "FEMALE",
                      ),
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor),
                )
              ],
            )),
            Expanded(
              child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(inputHeight.toString(), style: kNumberStyle),
                          Text(
                            "cm",
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFeb1555),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29eb1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: inputHeight.toDouble(),
                          max: 220.0,
                          min: 120.0,
                          inactiveColor: Color(0xFF8d8e98),
                          onChanged: (double newValue) {
                            setState(() {
                              inputHeight = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  colour: kContainerColour),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: kLabelTextStyle),
                          Text(inputWeight.toString(), style: kNumberStyle),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    if (inputWeight > 199) {
                                      inputWeight = 200;
                                    } else {
                                      inputWeight++;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ReusableButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (inputWeight < 1) {
                                      inputWeight = 0;
                                    } else {
                                      inputWeight--;
                                    }
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: kContainerColour),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: kLabelTextStyle),
                          Text(age.toString(), style: kNumberStyle),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    if (age > 99) {
                                      age = 100;
                                    } else {
                                      age++;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ReusableButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (age < 1) {
                                      age = 0;
                                    } else {
                                      age--;
                                    }
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: kContainerColour),
                ),
              ],
            )),

            bottomButton(text: "CALCULATE", onTap:  () {
              CalculatorBrain calc = CalculatorBrain(height: inputHeight, weight: inputWeight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmi: calc.calulateBodyMass(),
                interpretation: calc.getInterpretation(),
                bmiResult: calc.getResult(),
              ),),);
            },)
          ],
        ));
  }


}


