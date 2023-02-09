import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Título do produto',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Valor do produto em R\$',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                  ),
                  onPressed: () {},
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
