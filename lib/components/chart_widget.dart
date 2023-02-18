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

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupedTransactions.map(
              (transaction) => Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: transaction['day'] as String,
                  value: transaction['value'] as double,
                  percentage: _weekTotalValue == 0 ? 0 : (transaction['value'] as double) / _weekTotalValue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
