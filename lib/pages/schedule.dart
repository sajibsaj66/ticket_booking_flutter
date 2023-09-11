import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bus_provider.dart';
import 'admindashboard.dart';
class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  void didChangeDependencies() {
    Provider.of<BusProvider>(context, listen: false).getAllBus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Schedule'),toolbarHeight: 40,actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
          }, icon:Icon(Icons.close,size: 20,))
        ]),
        body: Consumer<BusProvider>(
        builder: (context, provider, child) => ListView.builder(
        itemCount: provider.movieList.length,
        itemBuilder: (context, index) {
      final bus = provider.movieList[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 70,

                    decoration: BoxDecoration(borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),color: Colors.orange
                    ),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.airplane_ticket),
                        SizedBox(width: 20,),
                        Text('Date of Flight'),
                        SizedBox(width: 10,),
                        Text(bus.release_date),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),color: Colors.indigo.shade300
                    ),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.timer),
                        SizedBox(width: 20,),
                        Text('Time of Flight:'),
                        SizedBox(width: 10,),
                        Text(bus.time),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        }))
    );
  }
}

