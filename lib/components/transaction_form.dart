import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value) onSubmit;

  const TransactionForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void _submitForm() {
    final String title = titleController.text;
    final double value = double.tryParse(valueController.text) ?? 0.0;

    if (title == null || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_) => _submitForm(),
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título do produto',
              ),
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              decoration: const InputDecoration(
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
                  onPressed: _submitForm,
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
