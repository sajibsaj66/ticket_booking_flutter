import 'package:flutter/material.dart';

import 'admindashboard.dart';
import 'new_bus_add.dart';

class Admin_page extends StatefulWidget {
  const Admin_page({Key? key}) : super(key: key);
  static const String routeName = '/admin';

  @override
  State<Admin_page> createState() => _Admin_pageState();
}

class _Admin_pageState extends State<Admin_page> {
  int _bottomindex = 0;
  final List<Widget> _children = [Dashboard(), NewBusAddPage()];
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
              icon: Icon(Icons.dashboard_outlined),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus_filled_outlined),
              label: 'Manage',
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
