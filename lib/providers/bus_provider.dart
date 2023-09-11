import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/busmodel.dart';

class BusProvider extends ChangeNotifier {
  List<BusModel> movieList = [];

  Future<int> insertMovie(BusModel movieModel) =>
      DbHelper.insertMovie(movieModel);

  void getAllBus() async {
    movieList = await DbHelper.getAllBus();
    notifyListeners();
  }
  Future<BusModel> getMovieById(int id) =>
      DbHelper.getBusById(id);

  void deleteMovie(int id) async {
    await DbHelper.deleteBus(id);
    getAllBus();
  }
  BusModel getBusFromList(int id) =>
      movieList.firstWhere((element) => element.id == id);
  Future<void> updateMovie(BusModel busModel) async {
    await DbHelper.updateMovie(busModel);
    getAllBus();
  }
}