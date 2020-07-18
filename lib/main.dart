import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // below uses named arguments
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense tracker'),
      ),
      body: Center(
        child: Text('This is a nice expense tracing app'),
      ),
    );
  }
}
