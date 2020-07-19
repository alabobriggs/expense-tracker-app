import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(
    this.addNewTransaction,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
              ),
              FlatButton(
                child: Text('Add transaction'),
                textColor: Colors.purple,
                onPressed: () => addNewTransaction(
                  title: titleController.text,
                  amount: double.parse(amountController.text ) ,
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
          padding: EdgeInsets.all(10),
        ),
        elevation: 5,
      ),
    );
  }
}
