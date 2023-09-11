import 'package:flutter/material.dart';
import 'about.dart';
import 'bus_list_page.dart';
import 'schedule.dart';
import 'userList.dart';
import 'welcome.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void didChangeDependencies() {
    //Provider.of<BusProvider>(context,listen: false).getBusList();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome()));
          }, icon:Icon(Icons.logout,size: 20,color: Colors.white,))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  height: 130, width: 130,
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.shade100),
                  child: TextButton.icon(onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const User_page(),
                      ),
                    );
                  }, icon: Icon(Icons.supervised_user_circle_sharp), label: Text('Admin'),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Card(
                child: Container(
                  height: 130, width: 130,
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.shade100),
                  child: TextButton.icon(onPressed: (){
                    Navigator.pushNamed(context, BusListPage.routeName);
                  }, icon: Icon(Icons.bus_alert), label: Text('Bus List'),
                  ),
                ),
              ),


            ],
          ),
          SizedBox(height: 20,),


          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  height: 130, width: 130,
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.shade100),
                  child: TextButton.icon(onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Schedule(),
                      ),
                    );
                  }, icon: Icon(Icons.schedule_outlined), label: Text('Schedule'),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Card(
                child: Container(
                  height: 130, width: 130,
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.shade100),
                  child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.bookmark_added_rounded), label: Text('Bookings'),
                  ),
                ),
              ),


            ],
          ),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  height: 130, width: 130,
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.shade100),
                  child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.cancel), label: Text('Cancelation'),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Card(
                child: Container(
                  height: 130, width: 130,
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.indigo.shade300),borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.shade100),
                  child: TextButton.icon(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>About()
                    ));
                  }, icon: Icon(Icons.info), label: Text('About'),
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
