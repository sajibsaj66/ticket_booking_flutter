import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/ticketmodel.dart';
class Ticketprovider extends ChangeNotifier {
  //List<TicketModel> ticketlist = [];

 // Future<int> insertTicket(TicketModel ticketModel) =>
     // DbHelper.insertTicket(ticketModel);

  void getAllTicket() async {
    //ticketlist = await DbHelper.getAllTicket();
    notifyListeners();
  }
  //Future<TicketModel> getticketById(int id) =>
     // DbHelper.getticketById(id);

  void deleteticket(int id) async {
    await DbHelper.deleteBus(id);
    getAllTicket();
  }

}