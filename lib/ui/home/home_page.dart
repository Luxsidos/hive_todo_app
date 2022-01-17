import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo_app/controller/boxes.dart';
import 'package:hive_todo_app/data/models/transaction.dart';
import 'package:hive_todo_app/ui/home/widgets/fill_data.dart';
import 'package:hive_todo_app/ui/home/widgets/products.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO APP WITH HIVE"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Transaction>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context, box, _) {
          final transactions = box.values.toList().cast<Transaction>();

          debugPrint(box.values.toString());

          return Products(transactions);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const FillData(
                isNewProduct: true,
              );
            },
          ).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
