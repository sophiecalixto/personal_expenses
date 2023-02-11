import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'dart:math';

void main() {
  runApp(PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  PersonalExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Ubuntu',
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Colors.purple,
          secondary: Colors.purple,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactionList = [
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

  void _addTransaction(String title, double value) {
    Transaction newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      time: DateTime.now(),
    );

    setState(() {
      transactionList.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Despesas Pessoais"),
        actions: [
          IconButton(
            onPressed: () => _openTransactionModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              color: Colors.purple,
              child: Text("Gráfico de gastos"),
            ),
            TransactionList(
              transactionList: transactionList,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionModal(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
