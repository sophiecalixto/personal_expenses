import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  const TransactionList({super.key, required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          final transaction = transactionList[index];

          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 5,
                  ),
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    style: Theme.of(context).textTheme.headlineLarge,
                    'R\$ ${transaction.value.toStringAsFixed(0)}',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 210,
                      child: Text(
                        softWrap: true,
                        style: Theme.of(context).textTheme.headlineMedium,
                        transaction.title,
                      ),
                    ),
                    const Divider(),
                    Text(
                      style: Theme.of(context).textTheme.headlineSmall,
                      DateFormat('d MMM, y').format(transaction.time),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
