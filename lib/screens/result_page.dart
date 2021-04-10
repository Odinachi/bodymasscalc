import 'file:///C:/Users/FM/Desktop/flutter/bmcalc/lib/components/constants.dart';
import 'file:///C:/Users/FM/Desktop/flutter/bmcalc/lib/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String interpretation;
  final String bmi;

  ResultPage({@required this.bmi,@required this.bmiResult,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("YOUR RESULT", style: kTitleTextStyle))),
          Expanded(flex: 5,child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(bmiResult, style: kResultTextStyle,),
                Text(bmi, style: kBMItextStyle,),
                Text(interpretation,textAlign: TextAlign.center, style: kBodyTextStyle,)
              ],
            ),
            colour: kActiveCardColor,)),
          bottomButton(text: "Re-Calculate", onTap: () {
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
