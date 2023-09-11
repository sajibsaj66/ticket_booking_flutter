
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../utils/constants.dart';
import 'launcher_page.dart';


class LoginPage extends StatefulWidget {
  static const String routeName ='loginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errMsg = '';
  bool obscureText = true;
  bool isLogin = true;
  bool isFocus = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40,),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
                alignment: Alignment.topCenter,
                children:
                [
                  Material(
                    elevation: 5,
                    child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset('assets/bus_admin.jpg',fit:BoxFit.fill)),
                  ),
                  Positioned(
                    top: 7,
                    child: Text(''
                    ),
                  ),
                ]
            ),
            SizedBox(height: 10),
            Text(
              "Log in to your existant account ",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(.70),
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              // Email form starts here
              child: TextFormField(
                  focusNode: FocusNode(),
                  onTap: (){

                    isFocus=!isFocus;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      // color: isFocus ? Colors.greenAccent[700] : Colors.grey ,
                    ),
                    hintText: "Email",
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
                        color: Colors.green,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 20,),
            // Password Form filled stats here
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: passController,
                obscureText: obscureText,
                obscuringCharacter: "*",
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                  hintText: "Password",

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(.25),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: 260,
              child: TextButton(
                onPressed: () {
                  isLogin = true;
                  _authenticate();
             //Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_page()));
                },
                child: Text(
                  "LOG IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 2),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[700],
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.65),
                    letterSpacing: 1,
                  ),
                ),
                TextButton(
                  onPressed: (){
                    isLogin = false;
                    _authenticate();
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  _setErrorMsg(String msg) {
    setState(() {
      errMsg = msg;
    });
  }

  _authenticate() async {
    final provider = Provider.of<UserProvider>(context, listen: false);
    if(_formKey.currentState!.validate()) {
      final email = emailController.text;
      final pass = passController.text;
      final user = await provider.getUserByEmail(email);
      if(isLogin) {
        //login btn is clicked
        if(user == null) {
          showMsg(context, 'User does not exist');

        }
        else {
          //check password
          if(pass == user.password) {
            await setLoginStatus(true);
            await setUserId(user.userId!);
            Navigator.pushReplacementNamed(context, LauncherPage.routeName);
          } else {
            //password did not match
          showMsg(context, 'Wrong Password');
          }
        }
      } else {
        //register btn is clicked
        if(user != null) {
          showMsg(context, 'ser already exists');

        } else {
          final user = UserModel(
            email: email,
            password: pass,

          );
          final rowId = await provider.insertUser(user);
          await setLoginStatus(true);
          await setUserId(rowId);
          Navigator.pushReplacementNamed(context, LauncherPage.routeName);
        }
      }
    }
  }

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));


Future<bool> setLoginStatus(bool status) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setBool(isLoggedIn, status);
}

Future<bool> getLoginStatus() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getBool(isLoggedIn) ?? false;
}

Future<bool> setUserId(int id) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt(userId, id);
}

Future<int> getUserId() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt(userId) ?? 0;
}}