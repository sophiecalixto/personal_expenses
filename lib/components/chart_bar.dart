import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar({
    super.key,
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrainsts) => Column(
        children: [
          SizedBox(
            height: constrainsts.maxHeight * 0.15,
            child: FittedBox(
              child: Text("R\$ ${value.toStringAsFixed(2)}"),
            ),
          ),
          SizedBox(height: constrainsts.maxHeight * 0.05),
          SizedBox(
            height: constrainsts.maxHeight * 0.6,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(220, 220, 200, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: constrainsts.maxHeight * 0.05),
          SizedBox(
            height: constrainsts.maxHeight * 0.15,
            child: FittedBox(child: Text(label)),
          ),
        ],
      ),
    );
  }
}
