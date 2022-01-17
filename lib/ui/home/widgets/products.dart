import 'package:flutter/material.dart';
import 'package:hive_todo_app/controller/crud.dart';
import 'package:hive_todo_app/data/models/transaction.dart';
import 'package:hive_todo_app/ui/home/widgets/fill_data.dart';

class Products extends StatefulWidget {
  final List<Transaction> _transactions;
  const Products(this._transactions, {Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: widget._transactions.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 120.0,
          child: Column(
            children: [
              ListTile(
                title: Text(widget._transactions[index].name),
                subtitle:
                    Text(widget._transactions[index].createdDate.toString()),
                trailing: Text(
                  "\$${widget._transactions[index].amount}",
                  style: const TextStyle(fontSize: 20.0, color: Colors.green),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return FillData(
                              isNewProduct: false,
                              transaction: widget._transactions[index],
                            );
                          },
                        ).then((value) {
                          setState(() {});
                        });
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.delete),
                      label: const Text("Delete"),
                      onPressed: () {
                        AppCrud.deleteTransaction(widget._transactions[index]);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
