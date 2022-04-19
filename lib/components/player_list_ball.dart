import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Ball.dart';
import 'package:flutter_application_1/components/ball.dart';

class PlayerListWidget extends StatefulWidget {
  final String title;
  final List<Ball> player_balls;
  const PlayerListWidget(
      {Key? key, required this.title, required this.player_balls})
      : super(key: key);

  @override
  State<PlayerListWidget> createState() => _PlayerListWidgetState();
}

class _PlayerListWidgetState extends State<PlayerListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        widget.player_balls.isNotEmpty
            ? Flexible(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / .25,
                    ),
                    itemCount: widget.player_balls.length,
                    itemBuilder: (context, index) {
                      return BallWidget(
                          id: widget.player_balls[index].id,
                          url: widget.player_balls[index].url);
                    }),
              )
            : const Text('Player did not make any balls!',
                style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
