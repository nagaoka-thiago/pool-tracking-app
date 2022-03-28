import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Ball.dart';
import 'package:flutter_application_1/components/ball.dart';
import 'package:flutter_application_1/components/list_buttons.dart';

class MyDropButtonInputWidget extends StatefulWidget {
  final List<Ball> balls;
  final List<Ball> selectedBalls;
  const MyDropButtonInputWidget(
      {Key? key, required this.balls, required this.selectedBalls})
      : super(key: key);

  @override
  State<MyDropButtonInputWidget> createState() =>
      _MyDropButtonInputWidgetState(balls, selectedBalls);
}

class _MyDropButtonInputWidgetState extends State<MyDropButtonInputWidget> {
  List<Ball> balls;
  late Ball selected = balls[0];
  final List<Ball> selectedBalls;
  _MyDropButtonInputWidgetState(this.balls, this.selectedBalls);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        balls.isNotEmpty
            ? Container(
                width: 180,
                child: ListButtonsWidget(selectedBalls: selectedBalls),
              )
            : const Text('', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        balls.isNotEmpty
            ? DropdownButton<Ball>(
                value: balls[0],
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(height: 2, color: Colors.deepPurpleAccent),
                onChanged: (Ball? newValue) {
                  setState(() {
                    selected = newValue!;
                  });

                  bool found = false;
                  for (Ball item in selectedBalls) {
                    if (selected.id == item.id) {
                      found = true;
                    }
                  }
                  if (!found) {
                    selectedBalls.add(selected);
                  }
                },
                items: balls.map<DropdownMenuItem<Ball>>((Ball ball) {
                  return DropdownMenuItem<Ball>(
                      value: ball,
                      child: BallWidget(id: ball.id, url: ball.url));
                }).toList(),
              )
            : const Text('', style: TextStyle(fontSize: 18))
      ],
    );
  }
}
