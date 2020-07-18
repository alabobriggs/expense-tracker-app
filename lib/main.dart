import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '23fjslq',
      title: 'New shoes',
      amount: 4009,
      date: DateTime.now(),
    ),
    Transaction(
      id: '22fjslq',
      title: 'weekly groceries',
      amount: 4009,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // below uses named arguments
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expense tracker'),
          ),
          body: Column(
            children: <Widget>[
              Container(
                child: Card(
                  child: Text('Chart'),
                  elevation: 5,
                  color: Colors.blue,
                ),
                width: double.infinity,
              ),
              Card(
                child: Text('List of transactions'),
                color: Colors.red,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}
