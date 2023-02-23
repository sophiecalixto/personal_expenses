import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final void Function(String) onDelete;

  const TransactionList({super.key, required this.transactionList, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Não há transações cadastradas",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: constraints.maxHeight * 0.4,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactionList.length,
            itemBuilder: (context, index) {
              final transaction = transactionList[index];

              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          style: Theme.of(context).textTheme.headlineLarge,
                          'R\$ ${transaction.value.toStringAsFixed(0)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    style: Theme.of(context).textTheme.headlineMedium,
                    transaction.title,
                  ),
                  subtitle: Text(
                    style: Theme.of(context).textTheme.headlineSmall,
                    DateFormat('d MMM, y').format(transaction.time),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () => onDelete(transaction.id),
                  ),
                ),
              );
            },
          );
  }
}
