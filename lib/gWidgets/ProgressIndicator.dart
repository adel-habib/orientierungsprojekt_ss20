import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
class ProgressIdicator extends StatelessWidget {
  final int currentStep;
  ProgressIdicator({this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(top:10.0, bottom: 10, right: 25, left: 25),
          child: StepProgressIndicator(
            totalSteps: 10,
            currentStep: currentStep,
            size: 6,
            selectedColor: Colors.greenAccent,
            unselectedColor: Colors.grey,
          )
      ),
    );
  }
}
