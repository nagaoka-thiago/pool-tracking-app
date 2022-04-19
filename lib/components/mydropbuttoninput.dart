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
      _MyDropButtonInputWidgetState();
}

class _MyDropButtonInputWidgetState extends State<MyDropButtonInputWidget> {
  late Ball selected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = widget.balls[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.balls.isNotEmpty
            ? Container(
                width: 180,
                child: ListButtonsWidget(selectedBalls: widget.selectedBalls),
              )
            : const Text('', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        widget.balls.isNotEmpty
            ? DropdownButton<Ball>(
                value: widget.balls[0],
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(height: 2, color: Colors.deepPurpleAccent),
                onChanged: (Ball? newValue) {
                  setState(() {
                    selected = newValue!;
                  });

                  bool found = false;
                  for (Ball item in widget.selectedBalls) {
                    if (selected.id == item.id) {
                      found = true;
                    }
                  }
                  if (!found) {
                    widget.selectedBalls.add(selected);
                  }
                },
                items: widget.balls.map<DropdownMenuItem<Ball>>((Ball ball) {
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
