import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Ball.dart';
import 'package:flutter_application_1/components/mydropbuttoninput.dart';

class InputsWidget extends StatefulWidget {
  final List<Ball> balls;
  final List<Ball> selectedBalls;
  final Function deleteBalls;
  final Function reset;
  const InputsWidget(
      {Key? key,
      required this.balls,
      required this.selectedBalls,
      required this.deleteBalls,
      required this.reset})
      : super(key: key);

  @override
  State<InputsWidget> createState() => _InputsWidgetState(
      this.balls, this.selectedBalls, this.deleteBalls, this.reset);
}

class _InputsWidgetState extends State<InputsWidget> {
  final List<Ball> balls;
  final List<Ball> selectedBalls;
  final Function deleteBalls;
  final Function reset;

  _InputsWidgetState(
      this.balls, this.selectedBalls, this.deleteBalls, this.reset);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyDropButtonInputWidget(
                  balls: balls, selectedBalls: selectedBalls)
            ],
          ),
          Column(children: [
            balls.isNotEmpty
                ? TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    onPressed: () {
                      deleteBalls();
                    },
                    child: const Text(
                      'Confirm the balls',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                : const Text('', style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              onPressed: () {
                reset();
              },
              child: const Text(
                'Reset',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ])
        ]);
  }
}
