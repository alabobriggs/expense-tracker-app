import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatelessWidget {
  final List<Transaction> userTransactions;

  final Function addNewTransaction;

  UserTransactions({
    @required this.userTransactions,
    @required this.addNewTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(
          userTransactions,
        ),
      ],
    );
  }
}
