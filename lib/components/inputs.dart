import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/ball_model.dart';
import 'package:flutter_application_1/components/mydropbuttoninput.dart';

class InputsWidget extends StatefulWidget {
  final List<Ball> balls;
  final List<Ball> selectedBalls;
  final Function deleteBalls;
  final Function reset;
  Ball? selected;
  InputsWidget(
      {Key? key,
      required this.balls,
      required this.selectedBalls,
      required this.deleteBalls,
      required this.reset,
      required this.selected})
      : super(key: key);

  @override
  State<InputsWidget> createState() => _InputsWidgetState();
}

class _InputsWidgetState extends State<InputsWidget> {
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
                  balls: widget.balls,
                  selectedBalls: widget.selectedBalls,
                  selected: widget.selected)
            ],
          ),
          Column(children: [
            widget.balls.isNotEmpty
                ? TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    onPressed: () {
                      widget.deleteBalls();
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
                widget.reset();
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
