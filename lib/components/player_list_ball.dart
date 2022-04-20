import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/ball_model.dart';
import 'package:flutter_application_1/components/ball.dart';

class PlayerListWidget extends StatefulWidget {
  final String title;
  final List<Ball> playerBalls;
  const PlayerListWidget(
      {Key? key, required this.title, required this.playerBalls})
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
        widget.playerBalls.isNotEmpty
            ? Flexible(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / .25,
                    ),
                    itemCount: widget.playerBalls.length,
                    itemBuilder: (context, index) {
                      return BallWidget(
                          id: widget.playerBalls[index].id,
                          url: widget.playerBalls[index].url);
                    }),
              )
            : const Text('Player did not make any balls!',
                style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
