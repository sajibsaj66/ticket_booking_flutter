import 'package:flutter/material.dart';
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text('About'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/bus_icon.png',width: 170,height: 170,),
        Text('𝐃𝐚𝐚𝐤 𝐓𝐢𝐜𝐤𝐞𝐭',style: TextStyle( fontSize: 25,color: Colors.indigo.shade900),textAlign: TextAlign.center,),
SizedBox(height: 20,),
            Text('Daak Ticket app connects you to every public bus services throughout the country. It shows routs, list of buses, their schedule, and fare that helps the user find the best option to get from point A to point B. It gives the user a detailed instruction on how to get any bus ticket booked staying at home instead of rushing over crowdy bus ticket counters, the easiest way possible.',style: TextStyle( fontSize: 14,color: Colors.indigo.shade900),textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
