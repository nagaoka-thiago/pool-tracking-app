import 'package:flutter/material.dart';

class BallWidget extends StatelessWidget {
  final int id;
  final String url;
  const BallWidget({Key? key, required this.id, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30,
        height: 30,
        child: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ));
  }
}
