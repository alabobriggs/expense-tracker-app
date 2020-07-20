import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(
    this.addNewTransaction,
  );

  void onSubmitHandler() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addNewTransaction(
      title: enteredTitle,
      amount: enteredAmount,
    );
  }

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
                onSubmitted: (_) => onSubmitHandler(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => onSubmitHandler(),
              ),
              FlatButton(
                child: Text('Add transaction'),
                textColor: Colors.purple,
                onPressed: onSubmitHandler,
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
