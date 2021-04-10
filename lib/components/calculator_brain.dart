import 'dart:math';

class CalculatorBrain {

  final int height;
  final int weight;


  CalculatorBrain({this.weight, this.height});

  double _bmi;
  String calulateBodyMass() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight.  Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight.  Good job!';
    } else {
      return 'You have a lower than normal body weight.  Try to eat a bit more.';
    }
  }
}