import 'Dart:io';
import 'package:my_app/models/incomes_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbIncomes {
  static final DbIncomes instance = DbIncomes._instance();
  static Database _db;

  DbIncomes._instance();

  String incomesTable = 'incomes_table';
  String colId = 'id';
  String colNama = 'nama';
  String colDate = 'date';
  String colJenis = 'jenis';
  String colNominal = 'nominal';

  // Incomes Tables
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
    String path = dir.path + 'incomes_list.db';
    final incomesListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return incomesListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $incomesTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colNama TEXT, $colDate TEXT, $colJenis TEXT, $colNominal INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getincomesMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(incomesTable);
    return result;
  }

  Future<List<Incomes>> getIncomesList() async {
    final List<Map<String, dynamic>> incomesMapList = await getincomesMapList();
    final List<Incomes> incomesList = [];
    incomesMapList.forEach((incomesMap) {
      incomesList.add(Incomes.fromMap(incomesMap));
    });
    return incomesList;
  }

  Future<int> insertIncomes(Incomes incomes) async {
    Database db = await this.db;
    final int result = await db.insert(incomesTable, incomes.toMap());
    return result;
  }

  Future<int> updateIncomes(Incomes incomes) async {
    Database db = await this.db;
    final int result = await db.update(incomesTable, incomes.toMap(),
        where: '$colId = ?', whereArgs: [incomes.id]);
    return result;
  }

  Future<int> deleteIncomes(int id) async {
    Database db = await this.db;
    final int result =
      await db.delete(incomesTable, where: '$colId = ?', whereArgs: [id]
    );
    return result;
  }
}
