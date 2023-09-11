import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import 'bus_list_page.dart';
import 'content_model.dart';
import 'welcome.dart';
class Home_page extends StatefulWidget {
  static const String routeName ='/home';
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final _formKey = GlobalKey<FormState>();

  int? id;
  final nameController = TextEditingController();
@override
  void dispose() {
  nameController.dispose();
    super.dispose();
  }
  DateTime? date;
  String? selectedFrom;
  String? busname;
  String? selectedTo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 10,
        toolbarHeight: 40,
        title: Text('Find Bus'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome()));
          }, icon:Icon(Icons.close,size: 20,))
        ],
      ),
      body:
      Form(

        key: _formKey,
        child: ListView(
          children: [
            Image.asset(
              'assets/1.jpg',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(

                  decoration: InputDecoration(
                      hintText: 'Bus Name',
                      border: UnderlineInputBorder(
                          borderSide:
                          BorderSide(width: 1, color: Colors.black))),
                  items: busName
                      .map((e) => DropdownMenuItem(value: e, child: Text(e!)))
                      .toList(),
                  value: busname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Bus';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      busname = value;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(

                  decoration: InputDecoration(
                      hintText: 'From',
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
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(

                  decoration: InputDecoration(
                      hintText: 'To',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.indigo.shade900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: selectDate,
                        child: Text(
                          '  Choose a Date  ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                Colors.grey.shade600)),
                      ),
                      Text(date==null?'No Date Chosen': getDate(date!, '  dd/MM/yyyy'))
                    ],
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(25),
                child:ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BusListPage()));
                } , child: Text('Book'),style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.indigo.shade900)),))
          ],
        ),
      ),

    );
  }
  String getDate(DateTime dateTime, String date){
    return DateFormat(date).format(dateTime);
  }
  void selectDate() async{
    final selectdate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2023));
    if(selectdate!=null){
      setState(() {
        date= selectdate;
      });
    }
  }


}

void showMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),backgroundColor: Colors.red));
}
