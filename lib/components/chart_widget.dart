import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/components/chart_bar.dart';
import 'package:personal_expenses/models/transaction.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const ChartWidget({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final DateTime weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalSum = 0.0;

        for (int i = 0; i < recentTransactions.length; i++) {
          bool sameDay = recentTransactions[i].time.day == weekDay.day;
          bool sameMonth = recentTransactions[i].time.month == weekDay.month;
          bool sameYear = recentTransactions[i].time.year == weekDay.year;

          if (sameDay && sameMonth && sameYear) {
            totalSum += recentTransactions[i].value;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay),
          'value': totalSum,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ...groupedTransactions.map(
              (transaction) => ChartBar(
                label: transaction['day'] as String,
                value: transaction['value'] as double,
                percentage: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
