import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/helper_functions.dart';
import 'adminPage.dart';
import 'bus_list_page.dart';
import 'login_page.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName ="launcher_page";
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    redirectUser();
    super.initState();
  }
  Future<void> redirectUser() async {
    if(await getLoginStatus()) {
      final id = await getUserId();
      await Provider.of<UserProvider>(context, listen: false).getUserById(id);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_page()));
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launcher Page"),
      ),
    );
  }

  void redirectUser() {}
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: Center(child: CircularProgressIndicator(),),
    );
  }
}
