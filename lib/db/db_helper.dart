
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

import '../models/busmodel.dart';
import '../models/movie_favorite.dart';
import '../models/ticketmodel.dart';
import '../models/user_model.dart';

class DbHelper {
  static const String createTableMovie = '''create table $tableMovie(
  $tblMovieColId integer primary key autoincrement,
  $tblMovieColName text,
  $tblMovieColDes text,
  $tblMovieColType text,
  $tblMovieColTypee text,
  $tblMovieColImage text,
  $tblMovieColRelease text,
  $tblMovieColtime text,
  $tblMovieColBudget integer,
  $tblMovieColBudgets integer)''';

  static const String createTableUser = '''create table $tableUser(
  $tblUserColId integer primary key autoincrement,
  $tblUserColEmail text,
  $tblUserColPassword text)''';

  static const String createTableRating = '''create table $tableRating(
  $tblRatingColMovieId integer,
  $tblRatingColUserId integer,
  $tblRatingColDate text,
  $tblRatingColUserReviews text,
  $tblColRating real)''';

  static const String createTableFavorite = '''create table $tableFavorite(
  $tblFavColMovieId integer,
  $tblFavColUserId integer,
  $tblFavColFavorite integer)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'movie_db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(createTableMovie);
      await db.execute(createTableUser);
      await db.execute(createTableRating);
      await db.execute(createTableFavorite);
    });
  }

  static Future<int> insertMovie(BusModel movieModel) async {
    final db = await open();
    return db.insert(tableMovie, movieModel.toMap());
  }

  static Future<int> insertUser(UserModel userModel) async {
    final db = await open();
    return db.insert(tableUser, userModel.toMap());
  }
  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(tableUser,
      where: '$tblUserColEmail = ?', whereArgs: [email],);
    if(mapList.isEmpty) return null;
    return UserModel.fromMap(mapList.first);
  }

  static Future<UserModel> getUserById(int id) async {
    final db = await open();
    final mapList = await db.query(tableUser,
      where: '$tblUserColId = ?', whereArgs: [id],);
    return UserModel.fromMap(mapList.first);
  }
  static Future<int> updateMovie(BusModel busModel) async {
    final db = await open();
    return db.update(tableMovie, busModel.toMap(),
      where: '$tblMovieColId = ?', whereArgs: [busModel.id],);
  }
  static Future<List<BusModel>> getAllBus() async {
    final db = await open();
    final mapList = await db.query(tableMovie);
    return List.generate(mapList.length, (index) =>
        BusModel.fromMap(mapList[index]));
  }
  static Future<List<UserModel>> getAllUser() async {
    final db = await open();
    final mapList = await db.query(tableUser);
    return List.generate(mapList.length, (index) =>
        UserModel.fromMap(mapList[index]));
  }

  static Future<BusModel> getBusById(int id) async {
    final db = await open();
    final mapList = await db.query(tableMovie,
      where: '$tblMovieColId = ?', whereArgs: [id],);
    return BusModel.fromMap(mapList.first);
  }

  static Future<int> deleteBus(int id) async {
    final db = await open();
    return db.delete(tableMovie,
      where: '$tblMovieColId = ?', whereArgs: [id],);

  }

}