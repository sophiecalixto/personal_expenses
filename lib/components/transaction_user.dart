import 'package:flutter/material.dart';
import 'package:personal_expenses/components/transaction_form.dart';
import 'package:personal_expenses/components/transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(
          transactionList: transactionList,
        ),
        const TransactionForm(),
      ],
    );
  }
}
