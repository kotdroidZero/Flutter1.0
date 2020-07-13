import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helloworld/task5/firebase_auth/firebase_auth.dart';
import 'package:helloworld/ui/utils/GeneralFunctions.dart';

class SignupScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final experienceController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = Auth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Signup',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlutterLogo(
                      size: 100.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_box),
                              counterStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: "Name")),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                      child: TextField(
                          controller: experienceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.confirmation_number),
                              counterStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: "Experience")),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                      child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              counterStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: "Email")),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              counterStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: "Password")),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 50, 16.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.teal,
                            onPressed: () {
                              _signUp();
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUp() {
    var email = emailController.text;
    var password = passwordController.text;

    if (email.isEmpty)
      Fluttertoast.showToast(msg: 'Please enter email');
    else if (!isValidEmail(email))
      Fluttertoast.showToast(msg: 'Not a valid email');
    else if (password.isEmpty)
      Fluttertoast.showToast(msg: 'Please enter password');
    else {
      Future<String> uid = auth.signUp(email, password);
      Fluttertoast.showToast(msg: 'UID: $uid');
    }
  }
}
