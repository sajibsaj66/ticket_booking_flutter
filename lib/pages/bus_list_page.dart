import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bus_provider.dart';
import 'BusDetails.dart';
import 'new_bus_add.dart';

class BusListPage extends StatefulWidget {
  static const String routeName='/list';
  const BusListPage({Key? key}) : super(key: key);

  @override
  State<BusListPage> createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {

  @override
  void didChangeDependencies() {
    Provider.of<BusProvider>(context, listen: false).getAllBus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, NewBusAddPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Bus List'),toolbarHeight: 40,),
      body: Consumer<BusProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.movieList.length,
          itemBuilder: (context, index) {
            final bus = provider.movieList[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
Navigator.pushNamed(context, BusDetails.routeName, arguments: [bus.id, bus.name]);
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.file(File(bus.image),width: double.infinity, height: 200,fit: BoxFit.cover,),
                        Text(bus.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.indigo.shade900,),),
                        Text(bus.description,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.grey.shade800,)),
                        Row(children: [
                          Text(bus.release_date,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.indigo,)),
                          const SizedBox(width: 50,),
                          Text(bus.time,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.indigo,)),
                          const SizedBox(width: 50,),
                          Text(bus.budget.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.red,)),
                          const Text('TK',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.red,),)
                        ],)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
