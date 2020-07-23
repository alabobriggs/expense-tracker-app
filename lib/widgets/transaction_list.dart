import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList({
    this.userTransactions,
    this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction yet',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, idx) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Text('\$${userTransactions[idx].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      '${userTransactions[idx].title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransactions[idx].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteTransaction(userTransactions[idx].id);
                      },
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
// Card(
//   child: Row(
//     children: <Widget>[
//       Container(
//         child: Text(
//           '\$${userTransactions[idx].amount.toStringAsFixed(2)}',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//         margin: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 15,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Theme.of(context).primaryColor,
//             width: 2,
//           ),
//         ),
//         padding: EdgeInsets.all(10),
//       ),
//       Column(
//         children: <Widget>[
//           Text(userTransactions[idx].title,
//               style: Theme.of(context).textTheme.headline2),
//           Text(
//             DateFormat.yMMMd()
//                 .format(userTransactions[idx].date),
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//           ),
//         ],
//         crossAxisAlignment: CrossAxisAlignment.start,
//       )
//     ],
//   ),
// );
