import 'package:expense/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekday).substring(0, 1),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionsValues.fold(
      0.0,
      (previousValue, item) => previousValue + item['amount'],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(totalSpending);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.loose,
              child: ChartBar(
                label: '${data['day']}',
                spendingAmount: data['amount'],
                spendingPercentOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}