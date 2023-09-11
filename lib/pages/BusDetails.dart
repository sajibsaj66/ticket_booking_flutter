import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/busmodel.dart';
import '../providers/bus_provider.dart';
import 'new_bus_add.dart';
class BusDetails extends StatefulWidget {
  static const String routeName='/details';

  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  int? id;
  late String name;
  late BusProvider provider;
  @override
  void didChangeDependencies() {
    provider = Provider.of<BusProvider>(context, listen: false);
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    id = argList[0];
    name = argList[1];
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name),toolbarHeight: 40,actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(
              context, NewBusAddPage.routeName, arguments: id)
              .then((value) => setState(() {
            name = value as String;
          })),
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: _deleteMovie,
          icon: const Icon(Icons.delete),
        ),
      ],),
      body: Center(
        child: FutureBuilder<BusModel>(
          future: provider.getMovieById(id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final bus = snapshot.data!;
              return ListView(
                children: [
                  Image.file(
                    File(bus.image),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                      title: Text(bus.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.indigo.shade900,),),
                      subtitle:  Text('${bus.type} To ${bus.typee}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.indigo.shade700,),),
                      trailing: Text('${bus.budget}BDT',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.red,),),
                       ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         const Icon(
                          Icons.alarm_sharp,
                          color: Colors.lightGreen,
                        ),
                          Text(bus.time,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.lightGreen,),),
                       SizedBox(width:150,),
                       const Icon(
                          Icons.date_range_outlined,
                          color: Colors.lightGreen,
                        ),
                          Text(bus.release_date,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.lightGreen,)),],)

                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(bus.description),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return const Text('Failed to load data');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
  void _deleteMovie() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Delete $name?'),
      content: Text('Are you sure to delete $name?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('NO'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            provider.deleteMovie(id!);
            Navigator.pop(context);
          },
          child: const Text('YES'),
        )
      ],
    ));
  }
}
