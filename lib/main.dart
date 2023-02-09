import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> _transactionList = [
    Transaction(
      id: 'transacao-1',
      title: 'Livro Programação Orientada A Objetos',
      value: 80.0,
      time: DateTime.now(),
    ),
    Transaction(
      id: 'transacao-2',
      title: 'Comida Yuki',
      value: 40.0,
      time: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.purple,
            child: Text("Gráfico de gastos"),
          ),
          Column(
            children: [
              ..._transactionList
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
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(100),
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
          ),
        ],
      ),
    );
  }
}
