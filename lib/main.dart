import 'package:flutter/material.dart';
import 'package:personal_expenses/components/transaction_user.dart';

void main() {
  runApp(const PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Card(
            color: Colors.purple,
            child: Text("Gráfico de gastos"),
          ),
          TransactionUser(),
        ],
      ),
    );
  }
}
