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
  State<PlayerListWidget> createState() =>
      _PlayerListWidgetState(this.title, this.player_balls);
}

class _PlayerListWidgetState extends State<PlayerListWidget> {
  final String title;
  List<Ball> player_balls;

  _PlayerListWidgetState(this.title, this.player_balls);

  @override
  void initState() {
    player_balls = widget.player_balls;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        player_balls.isNotEmpty
            ? Flexible(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / .25,
                    ),
                    itemCount: player_balls.length,
                    itemBuilder: (context, index) {
                      return BallWidget(
                          id: player_balls[index].id,
                          url: player_balls[index].url);
                    }),
              )
            : const Text('Player did not make any balls!',
                style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
