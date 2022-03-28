import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/first_page.dart';
import 'package:flutter_application_1/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pool Ball Tracking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool _showPage;

  @override
  void initState() {
    _showPage = false;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _showPage = !_showPage;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
                opacity: !_showPage ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: const FirstPageWidget(),
                onEnd: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPageWidget()));
                }),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
