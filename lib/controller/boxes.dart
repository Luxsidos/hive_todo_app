import 'package:hive/hive.dart';
import 'package:hive_todo_app/data/models/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>("transaction");
}
