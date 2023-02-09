import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  const TransactionList({super.key, required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactionList
            .map(
              (transaction) => Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      padding: const EdgeInsets.all(40),
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        'R\$ ${transaction.value.toStringAsFixed(0)}',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          transaction.title,
                        ),
                        const Divider(),
                        Text(
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          DateFormat('d MMM, y').format(transaction.time),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
