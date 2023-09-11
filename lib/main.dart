import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/BusDetails.dart';
import 'pages/adminPage.dart';
import 'pages/admindashboard.dart';
import 'pages/bus_list_page.dart';
import 'pages/launcher_page.dart';
import 'pages/login_page.dart';
import 'pages/new_bus_add.dart';
import 'pages/onboarding.dart';
import 'pages/user.dart';
import 'pages/userSearchbus.dart';
import 'pages/welcome.dart';
import 'providers/bus_provider.dart';
import 'providers/user_provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => BusProvider()),
            ChangeNotifierProvider(create: (context)=>UserProvider()),

          ],
          child:  MyApp(showHome:showHome)));
}

class MyApp extends StatelessWidget {
  final bool showHome;


  const
  MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Booking',
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: showHome? const welcome(): OnBoarding() ,

      routes: {
        LoginPage.routeName:(context)=>const LoginPage(),
        LauncherPage.routeName:(context)=>const LauncherPage(),
        BusListPage.routeName:(context)=>const BusListPage(),
        NewBusAddPage.routeName:(context)=>const NewBusAddPage(),
        Admin_page.routeName:(context)=>const Admin_page(),
        Dashboard.routeName:(context)=>const Dashboard(),
        BusDetails.routeName:(context)=>const BusDetails(),
        Home_page.routeName:(context)=>const Home_page(),
        USer_page.routeName:(context)=>const USer_page(),

      },
    );
  }
}


