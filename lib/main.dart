import 'package:flutter/material.dart';
import 'package:personal_expenses/components/chart_widget.dart';
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
        textTheme: theme.textTheme.copyWith(
          headlineLarge: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          headlineMedium: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineSmall: const TextStyle(
            fontSize: 14,
            fontFamily: 'Ubuntu',
            color: Colors.grey,
          ),
        ),
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
        ),
        appBarTheme: theme.appBarTheme.copyWith(
          titleTextStyle: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18,
          ),
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
  final List<Transaction> transactionList = [];

  List<Transaction> get _recentTransactions {
    return transactionList.where(
      (element) {
        return element.time.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

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
            ChartWidget(recentTransactions: _recentTransactions),
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
