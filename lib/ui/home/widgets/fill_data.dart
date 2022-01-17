import 'package:flutter/material.dart';
import 'package:hive_todo_app/controller/crud.dart';
import 'package:hive_todo_app/data/models/transaction.dart';

class FillData extends StatefulWidget {
  final bool isNewProduct;
  final Transaction? transaction;
  const FillData({Key? key, required this.isNewProduct, this.transaction})
      : super(key: key);

  @override
  State<FillData> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<FillData> {
  TextEditingController nameController = TextEditingController(),
      amountController = TextEditingController();

  bool isExpanse = true;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("${widget.isNewProduct ? "Create" : "Edit"} Transaction"),
      contentPadding: const EdgeInsets.all(8.0),
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: "Enter name"),
        ),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Enter amount"),
        ),
        RadioListTile<bool>(
          value: true,
          groupValue: isExpanse,
          onChanged: (event) {
            setState(() {
              isExpanse = event!;
            });
          },
          title: const Text("Expanse"),
        ),
        RadioListTile<bool>(
          value: false,
          groupValue: isExpanse,
          onChanged: (event) {
            setState(() {
              isExpanse = event!;
            });
          },
          title: const Text("Income"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            OutlinedButton(
              child: const Text("Submit"),
              onPressed: () {
                widget.isNewProduct
                    ? AppCrud.addTransaction(
                        nameController.text,
                        isExpanse,
                        double.parse(amountController.text),
                      )
                    : AppCrud.editTransaction(
                        widget.transaction!,
                        nameController.text,
                        isExpanse,
                        double.parse(amountController.text),
                      );
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    );
  }
}
