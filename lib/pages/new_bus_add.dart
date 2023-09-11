import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../models/busmodel.dart';
import '../providers/bus_provider.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class NewBusAddPage extends StatefulWidget {
  static const String routeName = '/new_movie';

  const NewBusAddPage({Key? key}) : super(key: key);

  @override
  State<NewBusAddPage> createState() => _NewBusAddPageState();
}

class _NewBusAddPageState extends State<NewBusAddPage> {
  late BusProvider busProvider;
  final nameController = TextEditingController();
  final seatController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedType;
  String? selectedFrom;
  String? selectedTo;
  DateTime? journeydate;
  String? imagePath;
  int? id;
  TimeOfDay timeOfDay=TimeOfDay(hour:00 , minute: 00);
  @override
  void didChangeDependencies() {
    busProvider = Provider.of<BusProvider>(context, listen: false);
    id = ModalRoute.of(context)!.settings.arguments as int?;
    if(id != null) {
      _setData();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {


    descriptionController.dispose();
    budgetController.dispose();
    seatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bus'),
        toolbarHeight: 40,
        actions: [
          IconButton(
            onPressed: saveMovie,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Colors.black38),
                        borderRadius:
                        BorderRadius.circular(10)),
                    child: imagePath == null
                        ? IconButton(icon: Icon(Icons.add), onPressed: getImage,)
                        : Image.file(
                      File(imagePath!),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_chart_outlined),
                      hintText: 'Add Name',
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 1, color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      showMsg(context, 'Bus Name is required');
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descriptionController,
                  maxLines: 3,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_comment_outlined),
                      hintText: 'Add Description',
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 1, color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      showMsg(context, 'Bus Description is required');
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButtonFormField<String>(
                  icon: Icon(Icons.location_pin,),
                    decoration: InputDecoration(
                        hintText: 'Select your Departure',
                        border: UnderlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.black))),
                    items: place
                        .map((e) => DropdownMenuItem(value: e, child: Text(e!)))
                        .toList(),
                    value: selectedFrom,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a type';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedFrom = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                    icon: Icon(Icons.location_pin,),
                    decoration: InputDecoration(
                        hintText: 'Select your Destination',
                        border: UnderlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.black))),
                    items: place
                        .map((e) => DropdownMenuItem(value: e, child: Text(e!)))
                        .toList(),
                    value: selectedTo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a type';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedTo = value;
                      });
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: budgetController,

                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      hintText: 'Add Ticket Price',
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 1, color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      showMsg(context, 'Ticket price is required');
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: seatController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.airline_seat_recline_extra_sharp),
                      hintText: 'Add Total Seat Number',
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 1, color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      showMsg(context, 'seat number is required');
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                      title: Text(journeydate == null ? 'Add Schedule' : getDate(
                          journeydate!, 'dd/MM/yyyy')),
                      leading: Icon(Icons.date_range_outlined),
                      onTap: selectjourneydate
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                      title: Text(
                          timeOfDay == null ? 'Add Time' : timeOfDay.format(context).toString()),
                      leading: Icon(Icons.more_time),
                      onTap: selectjourneytime
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text('Instruction'),
                    leading: Icon(Icons.help),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Scaffold(
                                    appBar: AppBar(
                                      toolbarHeight: 40,
                                    ),
                                    body: Text(''),
                                  )));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.info),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Scaffold(
                                    appBar: AppBar(
                                      toolbarHeight: 40,
                                    ),
                                    body: Text(''),
                                  )));
                    },
                  ),
                ),
              ),

            ],
          )),
    );
  }

  void selectjourneydate() async {
    final selectedjourneydate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2023),
    );
    if (selectedjourneydate != null) {
      setState(() {
        journeydate = selectedjourneydate;
      });
    }
  }
  String getDate(DateTime dateTime, String date) {
    return DateFormat(date).format(dateTime);
  }
  void getImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        imagePath = file.path;
      });
    }
  }
  void selectjourneytime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
      setState(() {
        timeOfDay=value!;
      });
    });
  }
  void saveMovie() {
    if (journeydate == null) {
      showMsg(context, 'Please select a date');
      return;
    }
    if (imagePath == null) {
      showMsg(context, 'Please select an image');
      return;
    }
    if (_formKey.currentState!.validate()) {

      final movie = BusModel(
        name: nameController.text,
        image: imagePath!,
        description: descriptionController.text,
        budget: int.parse(budgetController.text),
        type: selectedFrom!,
        typee: selectedTo!,
        budgets: int.parse(seatController.text),
        release_date: getDate(journeydate!, 'dd/MM/yyyy'),
        time: timeOfDay.format(context).toString()
      );if(id != null) {
        movie.id = id;
        busProvider
            .updateMovie(movie)
            .then((value) {
          Navigator.pop(context, movie.name);
        }).catchError((error) {
          print(error.toString());
        });
      }else {
        busProvider
            .insertMovie(movie)
            .then((value) {
          busProvider.getAllBus();
          Navigator.pop(context);
        })
            .catchError((error) {
          print(error.toString());
        });
      }
    }
  }
  void _setData() {
    final bus = busProvider.getBusFromList(id!);
    nameController.text = bus.name;
    descriptionController.text = bus.description;
    budgetController.text = bus.budget.toString();
    selectedFrom = bus.type;
    selectedTo = bus.typee;
    imagePath = bus.image;
    journeydate= DateFormat(datePattern).parse(bus.release_date);

  }
}
