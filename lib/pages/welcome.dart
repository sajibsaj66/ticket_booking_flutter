import 'package:flutter/material.dart';

import 'login_page.dart';
import 'user.dart';
class welcome extends StatefulWidget {
  static const String routeName ='/';
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Hello Dear,\n Welcome to our Ticket Booking App ',
            style: TextStyle( fontSize: 20,color: Colors.indigo.shade900),
            textAlign: TextAlign.center,),

          SizedBox(height: 20,),
          Container(
            child: Text('Ticket Bookiing',style: TextStyle( fontSize: 25,color: Colors.deepOrange),
              textAlign: TextAlign.center,),
          ),
        Image.asset('assets/bus-stop.png',height: 250,width: 250,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Card(
        child: Container(
        height: 100, width: 130,
        decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),
            borderRadius: BorderRadius.circular(10),color: Colors.orange.shade300),
        child: TextButton.icon(onPressed: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const LoginPage(),
            ),

          );
        }, icon: Icon(Icons.verified_user), label: Text('Sign in as Admin',),
        ),
      ),
    ),
          Card(
            child: Container(
              height: 100, width: 130,
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),borderRadius: BorderRadius.circular(10),color: Colors.orange.shade300),
              child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const USer_page(),
                  ),
                );
              }, icon: Icon(Icons.person), label: Text('Sign in as User'),
              ),
            ),
          ),])]));
  }
}
