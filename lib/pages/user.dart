import 'package:flutter/material.dart';

import 'TicketList.dart';
import 'seat.dart';
import 'userSearchbus.dart';
class USer_page extends StatefulWidget {
  static const String routeName = '/user';
  const USer_page({Key? key}) : super(key: key);

  @override
  State<USer_page> createState() => _USer_pageState();
}

class _USer_pageState extends State<USer_page> {
  int _bottomindex = 0;
  final List<Widget> _children = [Home_page(),Ticket(),SeatPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[_bottomindex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.indigo.shade900,
          onTap: selectedBar,
          currentIndex: _bottomindex,
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),BottomNavigationBarItem(
        icon: Icon(Icons.airplane_ticket_outlined),
        label: 'Tickets',
      ),BottomNavigationBarItem(
                icon: Icon(Icons.airline_seat_recline_extra_sharp),
                label: 'Seat Selection'
            ),
          ]),

    );
  }

  void selectedBar(int value) {
    setState(() {
      _bottomindex = value;
    });
  }
}

