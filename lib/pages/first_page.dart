import 'package:flutter/material.dart';

class FirstPageWidget extends StatelessWidget {
  const FirstPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Text(
          'Welcome to Pool Ball Tracking for Pool Players',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ));
  }
}
