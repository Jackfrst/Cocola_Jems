import 'package:cocola_jems/game/game_view/quiz_score.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/ascore.dart';

class ScoreDatabase{
  static final ScoreDatabase instance = ScoreDatabase._init();

  static Database? _database;

  ScoreDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('scores.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableScore(
        ${ScoreFields.id} $idType,
        ${ScoreFields.aquiz} $integerType,
        ${ScoreFields.aiquiz} $integerType,
        ${ScoreFields.apuzzle} $integerType,
        ${ScoreFields.name} $textType,
      )
    ''');
  }

  Future<Ascore> readScore(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableScore,
      columns: ScoreFields.values,
      where: '${ScoreFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Ascore.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Ascore>> readAllScore() async {
    final db = await instance.database;

    final orderBy = '${ScoreFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableScore, orderBy: orderBy);

    return result.map((json) => Ascore.fromJson(json)).toList();
  }

  Future<int> update(Ascore score) async {
    final db = await instance.database;

    return db.update(
      tableScore,
      score.toJson(),
      where: '${ScoreFields.id} = ?',
      whereArgs: [score.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableScore,
      where: '${ScoreFields.id} = ?',
      whereArgs: [id],
    );
  }



  Future<Ascore> create(Ascore score) async{
    final db = await instance.database;

    final id = await db.insert(tableScore, score.toJson());
    return score.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}