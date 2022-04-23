import 'package:flutter/material.dart';
import 'package:pocket_health/first_screen.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var MQ = MediaQuery.of(context);
    final double usableHeight =
        MQ.size.height - MQ.viewPadding.top - MQ.viewPadding.bottom;
    final double usableWidth = MQ.size.width;
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(246, 181, 120, 1),
        backgroundColor: Color.fromRGBO(246, 181, 120, 1),
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(246, 181, 120, 1),
        body: FirstScreen(
          MQ: MQ,
          usableHeight: usableHeight,
          usableWidth: usableWidth,
        ),
      ),
    );
  }
}
