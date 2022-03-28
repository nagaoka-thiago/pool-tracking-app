import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Ball.dart';

class ListButtonsWidget extends StatefulWidget {
  final List<Ball> selectedBalls;
  const ListButtonsWidget({Key? key, required this.selectedBalls})
      : super(key: key);

  @override
  State<ListButtonsWidget> createState() =>
      _ListButtonsWidgetState(this.selectedBalls);
}

class _ListButtonsWidgetState extends State<ListButtonsWidget> {
  final List<Ball> selectedBalls;

  _ListButtonsWidgetState(this.selectedBalls);

  @override
  Widget build(BuildContext context) {
    return selectedBalls.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: selectedBalls.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      onPressed: () {
                        if (index < selectedBalls.length) {
                          setState(() {
                            selectedBalls.removeAt(index);
                          });
                        }
                      },
                      child: Text('${selectedBalls[index].id}')));
            },
          )
        : const Text('No balls selected!');
  }
}