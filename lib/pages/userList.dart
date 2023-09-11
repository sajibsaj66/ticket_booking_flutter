import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'admindashboard.dart';
class User_page extends StatefulWidget {
  static const String routeName='/ulist';
  const User_page({Key? key}) : super(key: key);

  @override
  State<User_page> createState() => _User_pageState();
}

class _User_pageState extends State<User_page> {
  @override
  void didChangeDependencies() {
    Provider.of<UserProvider>(context, listen: false).getAllUser();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin List'),toolbarHeight: 40,actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
        }, icon:Icon(Icons.close,size: 20,))
      ],),
      body:Consumer<UserProvider>(
        builder: (context,provider,child)=>ListView.builder(
          itemCount: provider.userlist.length,
          itemBuilder: ( context, index) {
          final user=provider.userlist[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(elevation: 10,
              child: Container(
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Image.asset('assets/d.png',height: 70,width: 70,),
                      SizedBox(width:10,),
                      Column(
                        children: [
                          Text(user.email,style: TextStyle(fontSize: 20,color: Colors.indigo.shade900,fontWeight: FontWeight.w400),),
                          SizedBox(height: 10,),
                          Text('Admin who can change bus information and Delete',style: TextStyle(fontSize: 10,color: Colors.indigo.shade900,fontWeight: FontWeight.w400),)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },

        )
      ) ,
    );
  }
}
