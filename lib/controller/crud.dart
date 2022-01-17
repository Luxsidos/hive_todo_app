import 'package:hive_todo_app/controller/boxes.dart';
import 'package:hive_todo_app/data/models/transaction.dart';

class AppCrud {
  AppCrud._();
  int i = 0;

  static void addTransaction(String name, bool isExpanse, double amount) {
    final Transaction transaction = Transaction()
      ..name = name
      ..createdDate = DateTime.now()
      ..isExpanse = isExpanse
      ..amount = amount;

    final box = Boxes.getTransactions();

    box.add(transaction);
  }

  static void editTransaction(
    Transaction transaction,
    String name,
    bool isExpanse,
    double amount,
  ) {
    transaction.name = name;
    transaction.isExpanse = isExpanse;
    transaction.amount = amount;

    transaction.save();
  }

  static void deleteTransaction(Transaction transaction) {
    transaction.delete();
  }
}
