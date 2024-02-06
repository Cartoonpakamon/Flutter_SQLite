import 'package:sqlite/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class appDatabase {
  static Database? _database;
  final String tableName = 'topic';

  Future<Database> initializedb() async {
    if (_database == null) _database = await createdb();
    return _database!;
  }

  Future<Database> createdb() async {
    final path = await getDatabasesPath();

    var database = await openDatabase(
      join(path, 'topicDB.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $tableName(
           id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
           foodname TEXT,
           price TEXT,
           descriptionfood TEXT
           )''',
        );
      },
    );
    return database;
  }

  Future<int> insertData(topicModel model) async {
    var db = await initializedb();
    var result = await db.insert(tableName, model.toMap());
    return result;
  }

  Future<List<topicModel>> getAllData() async {
    var db = await initializedb();
    List<Map<String, dynamic>> result = await db.query(tableName);
    return List.generate(
      result.length,
      (index) => topicModel(
        id: result[index]['id'],
        foodname: result[index]['foodname'],
        price: result[index]['price'],
        descriptionfood: result[index]['descriptionfood'],
      ),
    );
  }
}