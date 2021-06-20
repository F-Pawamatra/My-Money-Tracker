import 'Dart:io';
import 'package:my_app/models/expenses_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbExpenses {
  static final DbExpenses instance = DbExpenses._instance();
  static Database _db;

  DbExpenses._instance();

  String expensesTable = 'expenses_table';
  String colId = 'id';
  String colNama = 'nama';
  String colDate = 'date';
  String colJenis = 'jenis';
  String colNominal = 'nominal';

  // Expenses Tables
  // Id  |  nama  |  Date  |  Jenis  |  Nominal
  //  1     ...       ...      ....        0
  //  2     ...       ...      ....        0
  //  3     ...       ...      ....        0

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'expenses_list.db';
    final expensesListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return expensesListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $expensesTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colNama TEXT, $colDate TEXT, $colJenis TEXT, $colNominal INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getexpensesMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(expensesTable);
    return result;
  }

  Future<List<Expenses>> getExpensesList() async {
    final List<Map<String, dynamic>> expensesMapList =
        await getexpensesMapList();
    final List<Expenses> expensesList = [];
    expensesMapList.forEach((expensesMap) {
      expensesList.add(Expenses.fromMap(expensesMap));
    });
    return expensesList;
  }

  // Future <int> getTotalExpense() async {
  //   List<Expenses> expensesList = await db.rawQuery('SELECT SUM ($colNominal) FROM $expensesTable');
  //   return result;
  // }

  Future<int> insertExpenses(Expenses expenses) async {
    Database db = await this.db;
    final int result = await db.insert(expensesTable, expenses.toMap());
    return result;
  }

  Future<int> updateExpenses(Expenses expenses) async {
    Database db = await this.db;
    final int result = await db.update(expensesTable, expenses.toMap(),
        where: '$colId = ?', whereArgs: [expenses.id]);
    return result;
  }

  Future<int> deleteExpenses(int id) async {
    Database db = await this.db;
    final int result =
        await db.delete(expensesTable, where: '$colId = ?', whereArgs: [id]);
    return result;
  }
}
