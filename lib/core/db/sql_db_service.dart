import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/model/user_model.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';

class SqlDbService {
  static final SqlDbService _sqlDbService = SqlDbService._internal();

  factory SqlDbService() => _sqlDbService;

  SqlDbService._internal();

  static String userstableKey = "users";
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'users.db');

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $userstableKey(id INTEGER PRIMARY KEY, email TEXT, first_name TEXT, last_name TEXT,avatar TEXT)',
    );
  }

  Future<void> addUser(UserModel users) async {
    final db = await _sqlDbService.database;

    await db.insert(
      userstableKey,
      users.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> addUsers(List<UserModel> list) async {
    final db = await _sqlDbService.database;

    for (var i in list) {
      await db.insert(
        userstableKey,
        i.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final db = await _sqlDbService.database;
      var maps = await db.query(userstableKey);

      var list = maps.map((e) => UserModel.fromJson(e)).toList();
      print(list.length.toString() + ' db141Success');
      return right(list);
    } catch (e) {
      print(e.toString() + ' db141Error');
      return left(LocalDbFailure(message: e.toString()));
    }
  }
}
