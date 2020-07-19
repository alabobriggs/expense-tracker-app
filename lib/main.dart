import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '23fjslq',
      title: 'New shoes',
      amount: 3490,
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
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Amount',
                        ),
                      ),
                      FlatButton(
                        child: Text('Add transaction'),
                        onPressed: () {},
                        textColor: Colors.purple,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end ,
                  ),
                  padding: EdgeInsets.all(10),
                ),
                elevation: 5,
              ),
              Column(
                children: transactions.map((transaction) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '\$${transaction.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              transaction.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(transaction.date),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          )),
    );
  }
}
