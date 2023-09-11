
import 'dart:collection';
import 'package:flutter/material.dart';

import 'user.dart';

class SeatPage extends StatefulWidget {
  static const String routeName ="seatPage";
  const SeatPage({Key? key}) : super(key: key);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final nameController = TextEditingController();
  final phnNumController = TextEditingController();
  final addressController = TextEditingController();

  int _radioSelected = 1;
   late String _radioVal;
  bool selected=false;
  bool selectionEnable=false;
  HashSet selectedSeat =new HashSet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>USer_page()));
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: Container(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ena Paribahan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Dhaka to Coxs-Bazar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Time: 07:00 Am',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Select Your Seat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                       //Text( selectionEnable ?  "getHeaderCountText()" : 'Not selected',
                       
                     // ),
                      SizedBox(height: 8),
                      Text(
                        'Total: 950 Tk',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                margin: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const Spacer(),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: Colors.indigo, width: 2),
                          ),
                        ),
                        const Spacer(flex: 2),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: Colors.indigo, width: 2),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.indigo, width: 2),
                      ),

                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),

                            crossAxisCount: 4,
                            mainAxisSpacing: 0,
                            crossAxisSpacing:6,

                          children: List.generate(40, (index) {
                            return CustomSeatGrid(index);
                          }),
              //
              // ]
     ),
    ),
    ),

                  ]
    ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/seat_1.jpg',
                      width: 28,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'available',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      'assets/seat_2.jpg',
                      width: 28,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'booked',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      'assets/seat_3.jpg',
                      width: 28,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'select',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.indigo.withOpacity(.25),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(


                      child:Center(child: Text('Personal Information',style: TextStyle( fontSize: 20,color: Colors.indigo.shade900),textAlign: TextAlign.center)) ,
                      decoration: BoxDecoration(

                          borderRadius:BorderRadius.circular(15)
                      ),
                    ),
                    const SizedBox(height:18),
                    TextField(
                        onTap: (){

                        },
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Enter your name",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(.25),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.indigo,
                              width: 1,
                            ),
                          ),
                        ),
                    ) ,
                    const SizedBox(height:18),
                    TextField(
                        onTap: (){

                        },
                        controller: phnNumController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter your phone number",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(.25),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.indigo,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                    ),
                    SizedBox(height: 15,),
                    TextField(
                      onTap: (){

                      },
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Enter your Address",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(.25),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Male'),
                  Radio(
                    value: 1,
                    groupValue: _radioSelected,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value!;
                        _radioVal = 'male';
                      });
                    },
                  ),
                  Text('Female'),
                  Radio(
                    value: 2,
                    groupValue: _radioSelected,
                    activeColor: Colors.pink,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value!;
                        _radioVal = 'female';
                      });
                    },
                  )
                ],
              ),
             SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.indigo,
                   ), child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Text(
                    'Proceed to payment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
                                          // method starts here
  void doMultiSelection (var index){
    setState(() {
      selectionEnable=true;
      if(selectedSeat.contains(index)){
        selectedSeat.remove(index);
      }
      else{
        selectedSeat.add(index);
      }
    });

  }

  String getHeaderCountText(){
    return selectedSeat.isNotEmpty ? selectedSeat.length.toString() : "0";
  }


   CustomSeatGrid(var index) {
    bool isBooked=false;
    return isBooked ? Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Image.asset(
            'assets/seat_2.jpg',
            width: 28,
          ),
        ),
        Text(index,style: TextStyle(color: Colors.grey),)
      ],
    ): GestureDetector(
      onTap: (){
       setState(() {
         // selected =!selected;
         doMultiSelection(index);
       });
      },
      child: Stack(fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
                    Container(
                              margin: const EdgeInsets.all(6),
                              child: Image.asset(
                                selectedSeat.contains(index) ?
                                'assets/seat_3.jpg':
                                'assets/seat_1.jpg',
                                width: 28,
                              ),
                            ),
          Text('$index',style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}