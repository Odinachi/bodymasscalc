import 'file:///C:/Users/FM/Desktop/flutter/bmcalc/lib/screens/result_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  Function onPress;
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour
        ),
      ),
    );
  }
}








class ReusableButton extends StatelessWidget {
  Function onPress;
  IconData icon;

  ReusableButton({@required this.onPress, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        elevation: 6.0,
        fillColor: Color(0xFF4c4f5e),
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        shape: CircleBorder(),
        onPressed: onPress);
  }
}


class bottomButton extends StatelessWidget {

  final String text;
  final Function onTap;

  bottomButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(text, style: kTextStyleButton,)),
        color: Color(0xFFeb1555),
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}
