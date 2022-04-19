import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Ball.dart';
import 'package:flutter_application_1/components/ball.dart';
import 'package:flutter_application_1/components/inputs.dart';
import 'package:flutter_application_1/components/player_list_ball.dart';
import 'package:flutter_application_1/helpers/constants.dart';

class SecondPageWidget extends StatefulWidget {
  const SecondPageWidget({Key? key}) : super(key: key);

  @override
  State<SecondPageWidget> createState() => _SecondPageWidgetState();
}

class _SecondPageWidgetState extends State<SecondPageWidget> {
  List<Ball> balls = [];
  List<Ball> selectedBalls = [];
  List<Ball> yourBalls = [];
  List<Ball> opponentBalls = [];
  bool yourTurn = true;

  @override
  void initState() {
    // TODO: implement initState
    balls.addAll(Constants.balls);
    selectedBalls = [];
    yourBalls = [];
    opponentBalls = [];
    yourTurn = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pool Ball Tracking'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 30,
                  child: balls.isNotEmpty
                      ? (yourTurn
                          ? const Text(
                              'It is your turn!',
                              style: TextStyle(fontSize: 18),
                            )
                          : const Text(
                              'It is your opponent`s turn!',
                              style: TextStyle(fontSize: 18),
                            ))
                      : yourTurn
                          ? const Text('Opponent won!',
                              style: TextStyle(fontSize: 18))
                          : const Text('You won!',
                              style: TextStyle(fontSize: 18))),
              const SizedBox(height: 20),
              Flexible(
                child: balls.isNotEmpty
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 1 / .25),
                        itemCount: balls.length,
                        itemBuilder: (context, index) {
                          return BallWidget(
                              id: balls[index].id, url: balls[index].url);
                        })
                    : const Text('All balls were made!'),
              ),
              const SizedBox(height: 20),
              Flexible(
                  child: InputsWidget(
                      balls: balls,
                      selectedBalls: selectedBalls,
                      deleteBalls: () {
                        setState(() {
                          if (selectedBalls.isNotEmpty) {
                            for (Ball selectedBall in selectedBalls) {
                              if (balls.isNotEmpty) {
                                balls.removeWhere(
                                    (ball) => selectedBall.id == ball.id);
                                if (yourTurn) {
                                  yourBalls.add(selectedBall);
                                } else {
                                  opponentBalls.add(selectedBall);
                                }
                              }
                            }
                            if (balls.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (builder) => AlertDialog(
                                        title: const Icon(
                                          Icons.handshake,
                                          color: Colors.green,
                                        ),
                                        content: Text((yourTurn
                                                ? 'Your opponent'
                                                : 'You') +
                                            ' won the game!'),
                                        actions: [
                                          TextButton(
                                              child: const Text('Fechar'),
                                              onPressed: () =>
                                                  Navigator.of(context).pop())
                                        ],
                                      ));
                            }
                          } else {
                            showDialog(
                                context: context,
                                builder: (builder) => AlertDialog(
                                      title: const Icon(
                                        Icons.warning,
                                        color: Colors.yellow,
                                      ),
                                      content: Text('No balls were made by ' +
                                          (!yourTurn
                                              ? 'you!'
                                              : 'your opponent!')),
                                      actions: [
                                        TextButton(
                                            child: const Text('Fechar'),
                                            onPressed: () =>
                                                Navigator.of(context).pop())
                                      ],
                                    ));
                          }
                          selectedBalls.clear();
                          yourTurn = !yourTurn;
                        });
                      },
                      reset: () {
                        setState(() {
                          balls.clear();
                          balls.addAll(Constants.balls);
                          selectedBalls.clear();
                          yourBalls.clear();
                          opponentBalls.clear();
                          yourTurn = true;
                        });
                      })),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: PlayerListWidget(
                          title: 'You', player_balls: yourBalls)),
                  Expanded(
                    child: PlayerListWidget(
                        title: 'Opponent', player_balls: opponentBalls),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
